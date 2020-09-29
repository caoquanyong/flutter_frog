import 'package:flutter_frog/core/data/entry.dart';
import 'package:flutter_frog/core/data/header.dart';
import 'package:flutter_frog/core/data/protobuf_frog_item.dart';
import 'package:flutter_frog/core/interfaces/frog_interfaces.dart';
import 'package:flutter_frog/logger/interfaces/frog_logger.dart';

class FrogLoggerImpl implements IFrogLogger {
  final Header _header;
  final int _productId;
  final IFrog _frog;
  final Map<String, dynamic> _extras;

  FrogLoggerImpl(this._frog, this._header, this._productId,
      [Map<String, dynamic> extras])
      : this._extras = extras;

  @override
  void log(String url,
      {int userId, String phoneNumber, Map<String, dynamic> parameters}) async {
    Entry entry = Entry(_productId);
    await entry.setUrl(url);
    _header.setUserId(userId);
    _header.setPhoneNumber(phoneNumber);
    IFrogItem item = ProtobufFrogItem(_header, entry);
    _consumeExtras(item, parameters);
    _frog.log(item);
  }

  @override
  void flush() {
    _frog.flush();
  }

  void _consumeExtras(IFrogItem frogItem, Map<String, dynamic> parameters) {
    if (_extras != null) {
      frogItem.putParameters(_extras);
    }
    if (parameters != null) {
      frogItem.putParameters(parameters);
    }
  }
}
