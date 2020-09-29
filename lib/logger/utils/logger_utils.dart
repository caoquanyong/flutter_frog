import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_frog/core/data/entry.dart';
import 'package:flutter_frog/core/data/header.dart';
import 'package:flutter_frog/core/dataBase/sql_manager.dart';
import 'package:flutter_frog/core/interfaces/frog_interfaces.dart';
import 'package:flutter_frog/logger/impl/frog_logger_impl.dart';
import 'package:flutter_frog/logger/interfaces/frog_logger.dart';

/// the parameters will be add to entry parameters of all logs,if repeated,it will be replaced by log({parameters}).
///@param frog, use FrogBuilder to help you to build IFrog.
///@param userId and phoneNumber, the initialize value. it will be replaced by IFrogLogger.log(userId, phoneNumber).
///

Future<IFrogLogger> initLogger(
    int device,
    String deviceId,
    String osVersion,
    String appVersion,
    String model,
    String manufacturer,
    String operator,
    String imei,
    int productId,
    IFrog frog,
    {int userId,
    String phoneNumber,
    Map<String, String> headExtensions,
    Map<String, dynamic> parameters}) async {
  try {
    await initDatabase();
    await initTable();
  } on Exception catch (e) {
    print(e);
  }
  double screenWidth = MediaQueryData.fromWindow(window).size.width;
  double screenHeight = MediaQueryData.fromWindow(window).size.height;
  double screenSize = 0;
  Header header = Header(device, deviceId, osVersion, appVersion, model,
      manufacturer, operator, screenSize, screenWidth, screenHeight, imei);
  header.setUserId(userId);
  header.setPhoneNumber(phoneNumber);
  header.putExtension(headExtensions);
  return FrogLoggerImpl(frog, header, productId, parameters);
}
