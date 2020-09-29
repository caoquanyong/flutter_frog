# flutter_frog

A new Flutter package to do log.

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.


//Basic usage

IFrogLogger _logger;
Future<void> initialize() async {
  int device;
  String deviceId;
  String osVersion;
  String appVersion = AppInfo.appVersion;
  String model; // 手机型号
  String manufacturer; // 手机厂商
  String operator; // 运营商， unicom， mobile， telecom
  String imei;
  int productId;
  String vendor; //渠道

  if (Platform.isIOS) {
    vendor = 'apple';
    device = 1;
    productId = 1101;
    IosDeviceInfo iosDeviceInfo = await AppInfo.getDeviceInfo();
    if (iosDeviceInfo.name.toLowerCase().contains('ipad')) {
      device = 3;
    }
    osVersion = iosDeviceInfo.systemVersion;
    model = iosDeviceInfo?.utsname?.machine;
    manufacturer = 'Apple';
    imei = iosDeviceInfo.identifierForVendor;
  } else if (Platform.isAndroid) {
    device = 2;
    productId = 1111;
    AndroidDeviceInfo androidDeviceInfo = await AppInfo.getDeviceInfo();
    osVersion = Platform.operatingSystemVersion;
    model = androidDeviceInfo.model;
    manufacturer = androidDeviceInfo.manufacturer;
    imei = androidDeviceInfo.androidId;
  }
  deviceId = "";
  operator = await _getSimName();
  _logger = await initLogger(
    device,
    deviceId,
    osVersion,
    appVersion,
    model,
    manufacturer,
    operator,
    imei,
    productId,
    _initFrog(),
    parameters: {"vendor": vendor},
  );
}

void log(String url, {Map<String, dynamic> parameters}) {
  _logger.log(
    url,
    userId: AccountStorage.userId,
    phoneNumber: AccountStorage.account,
    parameters: parameters,
  );
}

then you just to need call log to doLog: log('/.../.../...',parameters: {})
