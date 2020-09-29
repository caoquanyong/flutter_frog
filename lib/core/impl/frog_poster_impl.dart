import 'dart:convert';
import 'dart:io';
import 'package:flutter_frog/core/data/entry.dart';
import 'package:flutter_frog/core/data/header.dart';
import 'package:flutter_frog/core/data/protobuf_frog_item.dart';
import 'package:flutter_frog/core/frog_builder.dart';
import 'package:flutter_frog/core/data/frog_protobuf.dart' as pb;
import 'package:flutter_frog/core/interfaces/frog_interfaces.dart';

class FrogPosterImpl implements IFrogPoster {
  final DoPost doPost;
  FrogPosterImpl(this.doPost);

  @override
  Future<Set<String>> post(Map<String, dynamic> items) async {
    Map<Header, MapEntry<Set<String>, List<Entry>>> headerListMap = {};

    for (MapEntry<String, dynamic> entry in items.entries) {
      ProtobufFrogItem protobufFrogItem = _convertToFrogItem(entry.value);
      if (protobufFrogItem == null) {
        continue;
      }
      bool exist = false;
      for (Header header in headerListMap.keys) {
        if (header == protobufFrogItem.getHeader()) {
          exist = true;
          MapEntry<Set<String>, List<Entry>> keyAndEntriesMapEntry =
              headerListMap[header];
          keyAndEntriesMapEntry.value.add(protobufFrogItem.getEntry());
          keyAndEntriesMapEntry.key.add(entry.key);
          break;
        }
      }
      if (!exist) {
        Set<String> keys = {};
        List<Entry> entries = [];
        keys.add(entry.key);
        entries.add(protobufFrogItem.getEntry());
        MapEntry<Set<String>, List<Entry>> keyAndEntriesMapEntry =
            MapEntry(keys, entries);
        headerListMap[protobufFrogItem.getHeader()] = keyAndEntriesMapEntry;
      }
    }
    Set<String> postSuccessKeys = {};
    for (MapEntry<Header, MapEntry<Set<String>, List<Entry>>> entry
        in headerListMap.entries) {
      pb.PostData postData = pb.PostData();
      postData.head = entry.key.toHeaderProto();
      for (Entry entry in entry.value.value) {
        postData.entries.add(entry.toProtoEntry());
      }
      try {
        await doPost(GZipCodec().encode(postData.writeToBuffer()));
        postSuccessKeys.addAll(entry.value.key);
      } on Exception {}
    }
    return postSuccessKeys;
  }

  ProtobufFrogItem _convertToFrogItem(String jsonString) {
    try {
      Map<String, dynamic> map = json.decode(jsonString);
      ProtobufFrogItem item = ProtobufFrogItem.fromJson(map);
      return item;
    } on Exception {}
    return null;
  }
}
