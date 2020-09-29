import 'package:flutter_frog/core/dataBase/frog_db_provider.dart';
import 'package:flutter_frog/core/interfaces/frog_interfaces.dart';

class FrogStoreImpl implements IFrogStore {
  FrogDbProvider frogDbProvider;

  FrogStoreImpl({FrogDbProvider provider}) {
    this.frogDbProvider = provider ?? FrogDbProvider();
  }

  @override
  Future<int> count() {
    return frogDbProvider.count();
  }

  @override
  Future<List<Map<String, dynamic>>> get(int limit, bool remove) async {
    List<Map<String, dynamic>> res = await frogDbProvider.fetch(limit);
    if (remove) {
      Set<String> sets = Set();
      res.forEach((map) {
        sets.add(map['_key']);
      });
      await delete(sets);
    }
    return res;
  }

  @override
  Future<void> put(String key, String value) {
    return frogDbProvider.put(key, value);
  }

  @override
  Future<void> delete(Set<String> keys) async {
    await frogDbProvider.delete(keys);
  }
}
