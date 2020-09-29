abstract class IFrogLogger {
  /// do log
  ///
  /// the parameters will be added to entry parameters
  /// @param log
  ///
  void log(String url,
      {int userId, String phoneNumber, Map<String, dynamic> parameters});

  ///立即触发上传
  void flush();
}
