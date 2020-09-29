import 'dart:convert';

import 'package:fixnum/fixnum.dart' as fixnum;
import 'package:flutter/foundation.dart';
import 'package:flutter_frog/core/data/frog_protobuf.dart' as pb;

class Header {
  int _userId = 0; // 0表示不存在
  final int
      device; // 1(iPhone) 2(Android) 3(iPad) 4(Windows) 5(Browser) 0(Unknown)
  final String deviceId; // 相当于原来的globalDeviceId
  final String osVersion; // 操作系统版本号
  final String appVersion; // app版本号
  final String model; // 手机型号
  final String manufacturer; // 手机厂商
  final String operator; // 运营商， unicom， mobile， telecom
  String _phoneNumber = ''; // 手机号, 无法获得为空
  final double screenSize; // 屏幕物理尺寸（对角线），单位：英寸，如：5.46
  final double screenWidth; // 像素宽度
  final double screenHeight; // 像素高度
  final String imei;
  Map<String, String> _extensions = {}; // 产品线自定义通用字段

  Header(
    this.device,
    this.deviceId,
    this.osVersion,
    this.appVersion,
    this.model,
    this.manufacturer,
    this.operator,
    this.screenSize,
    this.screenWidth,
    this.screenHeight,
    this.imei,
  );

  Header.fromJson(Map<String, dynamic> map)
      : _userId = map['userId'] ?? 0,
        device = map['device'] ?? '',
        deviceId = map['deviceId'] ?? '',
        osVersion = map['osVersion'] ?? '',
        appVersion = map['appVersion'] ?? '',
        model = map['model'] ?? '',
        manufacturer = map['manufacturer'] ?? '',
        operator = map['operator'] ?? '',
        _phoneNumber = map['phoneNumber'] ?? '',
        screenSize = map['screenSize'] ?? '',
        screenWidth = map['screenWidth'] ?? 0,
        screenHeight = map['screenHeight'] ?? 0,
        imei = map['imei'] ?? '',
        _extensions = Map<String, String>.from(map['extensions']) ?? {};

  String toJson() {
    Map<String, dynamic> map = new Map();
    map['userId'] = this._userId;
    map['device'] = this.device;
    map['deviceId'] = this.deviceId;
    map['osVersion'] = this.osVersion;
    map['appVersion'] = this.appVersion;
    map['model'] = this.model;
    map['manufacturer'] = this.manufacturer;
    map['operator'] = this.operator;
    map['phoneNumber'] = this._phoneNumber;
    map['screenSize'] = this.screenSize;
    map['screenWidth'] = this.screenWidth;
    map['screenHeight'] = this.screenHeight;
    map['imei'] = this.imei;
    map['extensions'] = this._extensions;
    return json.encode(map);
  }

  void putExtension(Map<String, String> map) {
    _extensions.addAll(map ?? {});
  }

  void setUserId(int userId) {
    if (userId != null) {
      this._userId = userId;
    }
  }

  void setPhoneNumber(String phoneNumber) {
    if (phoneNumber != null) {
      this._phoneNumber = phoneNumber;
    }
  }

  pb.Header toHeaderProto() {
    pb.Header header = pb.Header();
    header.userId = fixnum.Int64(_userId);
    header.device = device;
    header.deviceId = deviceId;
    header.osVersion = osVersion;
    header.appVersion = appVersion;
    header.model = model;
    header.manufacturer = manufacturer;
    header.operator = operator;
    header.phoneNumber = _phoneNumber;
    header.screenSize = screenSize;
    header.screenWidth = screenWidth;
    header.screenHeight = screenHeight;
    header.imei = imei;
    if (_extensions != null) {
      _extensions.forEach((key, value) {
        pb.KeyValue keyValue = pb.KeyValue();
        keyValue.key = key;
        keyValue.value = value.toString();
        header.extension.add(keyValue);
      });
    }
    return header;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Header &&
          runtimeType == other.runtimeType &&
          _userId == other._userId &&
          device == other.device &&
          deviceId == other.deviceId &&
          osVersion == other.osVersion &&
          appVersion == other.appVersion &&
          model == other.model &&
          manufacturer == other.manufacturer &&
          operator == other.operator &&
          _phoneNumber == other._phoneNumber &&
          screenSize == other.screenSize &&
          screenWidth == other.screenWidth &&
          screenHeight == other.screenHeight &&
          imei == other.imei &&
          mapEquals(this._extensions, other._extensions);

  @override
  String toString() {
    return 'Header{_userId: $_userId, device: $device, deviceId: $deviceId, osVersion: $osVersion, appVersion: $appVersion, model: $model, manufacturer: $manufacturer, operator: $operator, _phoneNumber: $_phoneNumber, screenSize: $screenSize, screenWidth: $screenWidth, screenHeight: $screenHeight, imei: $imei, _extensions: $_extensions}';
  }
}
