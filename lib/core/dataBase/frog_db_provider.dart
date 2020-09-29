import 'package:flutter_frog/core/dataBase/sql_manager.dart';
import 'package:sqflite/sqflite.dart';

class FrogDbProvider {
  ///表名
  static const tableName = 'FrogInfo';

  static const seqIdTable = 'SeqIdTable';

  static const keyColumn = "_key";
  static const valueColumn = "_value";
  static const timeColumn = "_time";

  static const seqKey = '_seqKey';
  static const seqValue = '_seqValue';
  static int _seqId = 0;

  ///删除数据
  Future<void> delete(Set<String> keys) async {
    for (String key in keys) {
      await database
          .delete(tableName, where: "$keyColumn = ?", whereArgs: [key]);
    }
  }

  Future<void> put(String key, String value) async {
    var timeStamp = DateTime.now().millisecondsSinceEpoch;
    await database.insert(
        tableName, {keyColumn: key, valueColumn: value, timeColumn: timeStamp},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> fetch(int limit) async {
    return await database.query(tableName,
        columns: [keyColumn, valueColumn],
        orderBy: "$timeColumn DESC",
        limit: limit);
  }

  Future<int> count() async {
    return Sqflite.firstIntValue(
        await database.rawQuery('select count(*) from $tableName'));
  }

  static Future<void> _putSeqId(int seqId) async {
    await database.insert(seqIdTable, {seqKey: 'seqId', seqValue: seqId},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  ///每100条持久化seqId一次
  static Future<int> _getSeqId() async {
    List<Map<String, dynamic>> seqIdList =
        await database.query(seqIdTable, columns: [seqValue]);
    if (seqIdList != null &&
        seqIdList.isNotEmpty &&
        seqIdList[0][FrogDbProvider.seqValue] != null) {
      return seqIdList[0][FrogDbProvider.seqValue] + 100;
    }
    return 0;
  }

  static Future<int> getNextSeqId() async {
    if (_seqId <= 0) {
      _seqId = await _getSeqId();
    }
    if (_seqId % 100 == 0) {
      _putSeqId(_seqId);
    }
    ++_seqId;
    return _seqId;
  }
}
