import 'package:flutter_frog/core/dataBase/frog_db_provider.dart';
import 'package:sqflite/sqflite.dart';

const _databaseName = "frogKeyValueDB";
const _version = 1;
Database _dataBase;

Database get database => _dataBase;

Future<void> initDatabase(
    {String dbName = _databaseName, int version = _version}) async {
  var databasePath = await getDatabasesPath();
  String path = '$databasePath/$dbName';
  _dataBase = await openDatabase(path,
      version: version, onCreate: (Database db, int version) async {});
}

Future<bool> isTableExits(String tableName) async {
  if (_dataBase == null) {
    await initDatabase();
  }
  var res = await _dataBase.rawQuery(
      "select * from Sqlite_master where type = 'table' and name = '$tableName'");
  return res != null && res.length > 0;
}

String createTableString() {
  return '''
        create table ${FrogDbProvider.tableName} (
        ${FrogDbProvider.keyColumn} varchar primary key,${FrogDbProvider.valueColumn} text not null,
        ${FrogDbProvider.timeColumn} text not null)
      ''';
}

String createSeqTableString() {
  return '''
        create table ${FrogDbProvider.seqIdTable} (
        ${FrogDbProvider.seqKey} varchar primary key,${FrogDbProvider.seqValue} INTEGER)
      ''';
}

Future<void> initTable({String tableName = FrogDbProvider.tableName}) async {
  bool tableExits = await isTableExits(tableName);
  if (!tableExits) {
    _dataBase.execute(createTableString());
  }

  bool seqTableExits = await isTableExits(FrogDbProvider.seqIdTable);
  if (!seqTableExits) {
    _dataBase.execute(createSeqTableString());
  }
}

void close() async => _dataBase.close();
