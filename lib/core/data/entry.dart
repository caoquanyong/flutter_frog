import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_frog/core/data/frog_protobuf.dart' as pb;
import 'package:fixnum/fixnum.dart' as fixnum;
import 'package:flutter_frog/core/dataBase/frog_db_provider.dart';

class Entry {
  final int productId; // http://wiki.zhenguanyu.com/Planet/Constant
  int timestamp = 0; // 毫秒
  int seqId = 0; // 用于标示事件顺序的字段， 从app安装开始， 单调递增
  String url = ''; // url规范参考: http://wiki.zhenguanyu.com/Frog
  int net = 0; // 1(wifi), 2(2G), 3(3G), 4(4G), 0(unknown)
  Map<String, dynamic> parameters = {}; // 自定义统计

  static const netWifi = 1;
  static const netMobile = 4;
  static const netOther = 0;

  Entry(
    this.productId, {
    this.seqId = 0,
    this.net,
  });

  Entry.fromJson(Map<String, dynamic> map)
      : productId = map['productId'] ?? 0,
        timestamp = map['timestamp'] ?? 0,
        seqId = map['seqId'] ?? 0,
        url = map['url'] ?? '',
        net = map['net'] ?? 0,
        parameters = map["parameters"] ?? {};

  Future<void> setUrl(String url) async {
    this.url = url;
    timestamp = DateTime.now().millisecondsSinceEpoch;
    seqId = await FrogDbProvider.getNextSeqId();
    net = await _getNet();
  }

  String toJson() {
    Map<String, dynamic> map = {};
    map['productId'] = productId;
    map['timestamp'] = timestamp;
    map['seqId'] = seqId;
    map['url'] = url;
    map['net'] = net;
    map['parameters'] = parameters;
    return json.encode(map);
  }

  void putParameters(Map<String, dynamic> map) {
    parameters.addAll(map ?? {});
  }

  pb.Entry toProtoEntry() {
    pb.Entry entry = pb.Entry();
    entry.productId = productId;
    entry.timestamp = fixnum.Int64(timestamp);
    entry.seqId = fixnum.Int64(seqId);
    entry.url = url;
    entry.net = net;
    if (parameters != null) {
      parameters.forEach((key, value) {
        pb.KeyValue keyValue = pb.KeyValue();
        keyValue.key = key;
        keyValue.value = value.toString();
        entry.keyValues.add(keyValue);
      });
    }
    return entry;
  }

  Future<int> _getNet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      return netMobile;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return netWifi;
    }
    return netOther;
  }

  @override
  String toString() {
    return 'Entry{productId: $productId, timestamp: $timestamp, seqId: $seqId, url: $url, net: $net, parameters: $parameters}';
  }
}
