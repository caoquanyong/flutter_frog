import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class KeyValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i =
      $pb.BuilderInfo('KeyValue', createEmptyInstance: create)
        ..aQS(1, 'key')
        ..aQS(2, 'value');

  KeyValue._() : super();

  factory KeyValue() => create();

  factory KeyValue.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory KeyValue.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  KeyValue clone() => KeyValue()..mergeFromMessage(this);

  KeyValue copyWith(void Function(KeyValue) updates) =>
      super.copyWith((message) => updates(message as KeyValue));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KeyValue create() => KeyValue._();

  KeyValue createEmptyInstance() => create();

  static $pb.PbList<KeyValue> createRepeated() => $pb.PbList<KeyValue>();

  @$core.pragma('dart2js:noInline')
  static KeyValue getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KeyValue>(create);
  static KeyValue _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);

  @$pb.TagNumber(1)
  set key($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);

  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);

  @$pb.TagNumber(2)
  set value($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);

  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class Header extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i =
      $pb.BuilderInfo('Header', createEmptyInstance: create)
        ..a<$fixnum.Int64>(1, 'userId', $pb.PbFieldType.Q6,
            protoName: 'userId', defaultOrMaker: $fixnum.Int64.ZERO)
        ..a<$core.int>(2, 'device', $pb.PbFieldType.Q3)
        ..aQS(3, 'deviceId', protoName: 'deviceId')
        ..aQS(4, 'osVersion', protoName: 'osVersion')
        ..aQS(5, 'appVersion', protoName: 'appVersion')
        ..aQS(6, 'model')
        ..aQS(7, 'manufacturer')
        ..aQS(8, 'operator')
        ..aQS(9, 'phoneNumber', protoName: 'phoneNumber')
        ..a<$core.double>(10, 'screenSize', $pb.PbFieldType.QD,
            protoName: 'screenSize')
        ..a<$core.double>(11, 'screenWidth', $pb.PbFieldType.QD,
            protoName: 'screenWidth')
        ..a<$core.double>(12, 'screenHeight', $pb.PbFieldType.QD,
            protoName: 'screenHeight')
        ..aQS(13, 'imei')
        ..pc<KeyValue>(14, 'extension', $pb.PbFieldType.PM,
            subBuilder: KeyValue.create);

  Header._() : super();

  factory Header() => create();

  factory Header.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Header.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Header clone() => Header()..mergeFromMessage(this);

  Header copyWith(void Function(Header) updates) =>
      super.copyWith((message) => updates(message as Header));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Header create() => Header._();

  Header createEmptyInstance() => create();

  static $pb.PbList<Header> createRepeated() => $pb.PbList<Header>();

  @$core.pragma('dart2js:noInline')
  static Header getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Header>(create);
  static Header _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);

  @$pb.TagNumber(1)
  set userId($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);

  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get device => $_getIZ(1);

  @$pb.TagNumber(2)
  set device($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDevice() => $_has(1);

  @$pb.TagNumber(2)
  void clearDevice() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get deviceId => $_getSZ(2);

  @$pb.TagNumber(3)
  set deviceId($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDeviceId() => $_has(2);

  @$pb.TagNumber(3)
  void clearDeviceId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get osVersion => $_getSZ(3);

  @$pb.TagNumber(4)
  set osVersion($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOsVersion() => $_has(3);

  @$pb.TagNumber(4)
  void clearOsVersion() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get appVersion => $_getSZ(4);

  @$pb.TagNumber(5)
  set appVersion($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAppVersion() => $_has(4);

  @$pb.TagNumber(5)
  void clearAppVersion() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get model => $_getSZ(5);

  @$pb.TagNumber(6)
  set model($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasModel() => $_has(5);

  @$pb.TagNumber(6)
  void clearModel() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get manufacturer => $_getSZ(6);

  @$pb.TagNumber(7)
  set manufacturer($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasManufacturer() => $_has(6);

  @$pb.TagNumber(7)
  void clearManufacturer() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get operator => $_getSZ(7);

  @$pb.TagNumber(8)
  set operator($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasOperator() => $_has(7);

  @$pb.TagNumber(8)
  void clearOperator() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get phoneNumber => $_getSZ(8);

  @$pb.TagNumber(9)
  set phoneNumber($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasPhoneNumber() => $_has(8);

  @$pb.TagNumber(9)
  void clearPhoneNumber() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get screenSize => $_getN(9);

  @$pb.TagNumber(10)
  set screenSize($core.double v) {
    $_setDouble(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasScreenSize() => $_has(9);

  @$pb.TagNumber(10)
  void clearScreenSize() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get screenWidth => $_getN(10);

  @$pb.TagNumber(11)
  set screenWidth($core.double v) {
    $_setDouble(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasScreenWidth() => $_has(10);

  @$pb.TagNumber(11)
  void clearScreenWidth() => clearField(11);

  @$pb.TagNumber(12)
  $core.double get screenHeight => $_getN(11);

  @$pb.TagNumber(12)
  set screenHeight($core.double v) {
    $_setDouble(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasScreenHeight() => $_has(11);

  @$pb.TagNumber(12)
  void clearScreenHeight() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get imei => $_getSZ(12);

  @$pb.TagNumber(13)
  set imei($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasImei() => $_has(12);

  @$pb.TagNumber(13)
  void clearImei() => clearField(13);

  @$pb.TagNumber(14)
  $core.List<KeyValue> get extension => $_getList(13);
}

class Entry extends $pb.GeneratedMessage {
  static final $pb
      .BuilderInfo _i = $pb.BuilderInfo('Entry', createEmptyInstance: create)
    ..a<$core.int>(1, 'productId', $pb.PbFieldType.Q3, protoName: 'productId')
    ..a<$fixnum.Int64>(2, 'timestamp', $pb.PbFieldType.Q6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, 'seqId', $pb.PbFieldType.Q6,
        protoName: 'seqId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aQS(4, 'url')
    ..a<$core.int>(5, 'net', $pb.PbFieldType.Q3)
    ..pc<KeyValue>(6, 'keyValues', $pb.PbFieldType.PM,
        protoName: 'keyValues', subBuilder: KeyValue.create);

  Entry._() : super();

  factory Entry() => create();

  factory Entry.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Entry.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Entry clone() => Entry()..mergeFromMessage(this);

  Entry copyWith(void Function(Entry) updates) =>
      super.copyWith((message) => updates(message as Entry));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Entry create() => Entry._();

  Entry createEmptyInstance() => create();

  static $pb.PbList<Entry> createRepeated() => $pb.PbList<Entry>();

  @$core.pragma('dart2js:noInline')
  static Entry getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Entry>(create);
  static Entry _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get productId => $_getIZ(0);

  @$pb.TagNumber(1)
  set productId($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);

  @$pb.TagNumber(1)
  void clearProductId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get timestamp => $_getI64(1);

  @$pb.TagNumber(2)
  set timestamp($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTimestamp() => $_has(1);

  @$pb.TagNumber(2)
  void clearTimestamp() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get seqId => $_getI64(2);

  @$pb.TagNumber(3)
  set seqId($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSeqId() => $_has(2);

  @$pb.TagNumber(3)
  void clearSeqId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get url => $_getSZ(3);

  @$pb.TagNumber(4)
  set url($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUrl() => $_has(3);

  @$pb.TagNumber(4)
  void clearUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get net => $_getIZ(4);

  @$pb.TagNumber(5)
  set net($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNet() => $_has(4);

  @$pb.TagNumber(5)
  void clearNet() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<KeyValue> get keyValues => $_getList(5);
}

class PostData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i =
      $pb.BuilderInfo('PostData', createEmptyInstance: create)
        ..aQM<Header>(1, 'head', subBuilder: Header.create)
        ..pc<Entry>(2, 'entries', $pb.PbFieldType.PM, subBuilder: Entry.create);

  PostData._() : super();

  factory PostData() => create();

  factory PostData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory PostData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  PostData clone() => PostData()..mergeFromMessage(this);

  PostData copyWith(void Function(PostData) updates) =>
      super.copyWith((message) => updates(message as PostData));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PostData create() => PostData._();

  PostData createEmptyInstance() => create();

  static $pb.PbList<PostData> createRepeated() => $pb.PbList<PostData>();

  @$core.pragma('dart2js:noInline')
  static PostData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostData>(create);
  static PostData _defaultInstance;

  @$pb.TagNumber(1)
  Header get head => $_getN(0);

  @$pb.TagNumber(1)
  set head(Header v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHead() => $_has(0);

  @$pb.TagNumber(1)
  void clearHead() => clearField(1);

  @$pb.TagNumber(1)
  Header ensureHead() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<Entry> get entries => $_getList(1);
}
