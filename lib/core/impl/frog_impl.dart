import 'dart:math';
import 'package:flutter_frog/core/interfaces/frog_interfaces.dart';

class FrogImpl implements IFrog {
  final IFrogStore frogStore;
  final IFrogPoster frogPoster;
  final IFrogPostPolicy frogPostPolicy;
  static const MAX_MEM_LOG_CACHED = 1024;
  Map<String, String> memFrogQueue = {};
  bool _canFlush = true;

  FrogImpl(this.frogStore, this.frogPoster, this.frogPostPolicy);

  @override
  void log(IFrogItem frogItem) async {
    _doLog(frogItem);
    print(frogItem);
    if (await needFlush()) {
      _doFlush();
    }
  }

  @override
  void flush() {
    _doFlush();
  }

  void _doLog(IFrogItem frogItem) async {
    String value;
    value = frogItem.toJson();
    if (value == null) {
      return;
    }
    String key = _getKey();
    try {
      await frogStore.put(key, value);
    } on Exception {
      trim(memFrogQueue, MAX_MEM_LOG_CACHED, MAX_MEM_LOG_CACHED ~/ 10);
      memFrogQueue[key] = value;
    }
  }

  String _getKey() {
    String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    String randomInt = Random().nextInt(100).toString();
    return '$timeStamp-$randomInt';
  }

  void _doFlush() async {
    try {
      _canFlush = false;
      Map<String, dynamic> items = await _getFrogItems();
      while (items.isNotEmpty) {
        Set<String> successItemKeySets = await frogPoster.post(items);
        await removeSuccessItems(successItemKeySets);
        if (successItemKeySets == null ||
            successItemKeySets.length != items.length ||
            successItemKeySets.length < frogPostPolicy.getFrogDBPostLimit()) {
          _canFlush = true;
          return;
        }
        items = await _getFrogItems();
      }
      _canFlush = true;
    } on Exception {
      _canFlush = true;
    }
  }

  Future<Map<String, dynamic>> _getFrogItems() async {
    Map<String, dynamic> results = {};
    List<Map<String, dynamic>> items = await _getFrogDbItems();
    results.addAll(memFrogQueue);
    items.forEach((element) {
      results[element['_key']] = element['_value'];
    });
    return results;
  }

  Future<List<Map<String, dynamic>>> _getFrogDbItems() async {
    try {
      return await frogStore.get(frogPostPolicy.getFrogDBPostLimit(), false);
    } on Exception {
      return [];
    }
  }

  Future<void> removeSuccessItems(Set<String> successItemsKeySets) async {
    if (successItemsKeySets == null || successItemsKeySets.isEmpty) {
      return;
    }

    successItemsKeySets.forEach((String key) {
      memFrogQueue.remove(key);
    });
    await frogStore.delete(successItemsKeySets);
  }

  void trim(Map<String, String> memFrogQueue, int maxSize, int trimSize) {
    if (memFrogQueue == null || memFrogQueue.length < maxSize) {
      return;
    }
    List<String> keys = memFrogQueue.keys.toList();
    keys.sort();
    for (int i = 0; i < keys.length && i < trimSize && i < maxSize; ++i) {
      memFrogQueue.remove(keys[i]);
    }
  }

  Future<bool> needFlush() async {
    int count = await frogStore.count();
    return _canFlush && frogPostPolicy.shouldPost(memFrogQueue.length, count);
  }
}
