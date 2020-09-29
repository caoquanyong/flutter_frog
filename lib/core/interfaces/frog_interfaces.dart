abstract class IFrogItem {
  void putParameters(Map<String, dynamic> params);
  String toJson();
}

abstract class IFrog {
  /// 记录一条日志
  void log(IFrogItem frogItem);

  ///强制触发上传
  void flush();
}

abstract class IFrogPostPolicy {
  /// 上传策略
  ///
  /// @param memCacheSize     ：内存缓存日志数据数目
  /// @param frogDBCacheSize  ：数据库存储日志数目
  /// @return ：是否马上触发一次上传
  bool shouldPost(int memCacheSize, int frogDBCacheSize);

  /// @return ：一次上传从数据库中取出的数据条目
  int getFrogDBPostLimit();
}

abstract class IFrogStore {
  /// 写入一条数据
  /// @param key
  /// @param value
  Future<void> put(String key, String value);

  /// 取出 limit 条数据
  /// @param limit
  /// @param remove ：取出时是否删除
  /// @return  [ { "_key" : "135674467", "_value" : {"header" :{}, "entry":{}} },  { "_key" : "135674467", "_value" : {"header" :{}, "entry":{}} } ].
  Future<List<Map<String, dynamic>>> get(int limit, bool remove);

  /// 删除数据
  /// @param keys
  Future<void> delete(Set<String> keys);

  /// @return : 数据库中数据数目
  Future<int> count();
}

abstract class IFrogPoster {
  /// 同步上传数据
  ///
  /// @param items ：待上传的数据
  /// @return ：成功上传的数据的 key 的集合
  Future<Set<String>> post(Map<String, dynamic> items);
}
