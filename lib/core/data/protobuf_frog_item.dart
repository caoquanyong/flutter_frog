import 'dart:convert';

import 'package:flutter_frog/core/data/entry.dart';
import 'package:flutter_frog/core/data/header.dart';
import 'package:flutter_frog/core/interfaces/frog_interfaces.dart';

class ProtobufFrogItem implements IFrogItem {
  final Header header;
  final Entry entry;

  ProtobufFrogItem(this.header, this.entry);

  ProtobufFrogItem.fromJson(Map<String, dynamic> map)
      : header = Header.fromJson(json.decode(map['header'])),
        entry = Entry.fromJson(json.decode(map['entry']));

  Header getHeader() => header;

  Entry getEntry() => entry;

  @override
  void putParameters(Map<String, dynamic> params) {
    entry.putParameters(params);
  }

  @override
  String toJson() {
    Map<String, dynamic> map = {};
    map['header'] = header;
    map['entry'] = entry;
    try {
      return json.encode(map);
    } catch (e) {
      return null;
    }
  }

  @override
  String toString() {
    return 'frog{header: $header, entry: $entry}';
  }
}
