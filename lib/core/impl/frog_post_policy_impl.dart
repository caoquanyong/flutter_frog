import 'package:flutter_frog/core/interfaces/frog_interfaces.dart';

class FrogPostPolicyImpl implements IFrogPostPolicy {
  final int minPostTimeInterval = const Duration(minutes: 5).inMilliseconds;
  int lastPostTime = 0;

  @override
  bool shouldPost(int memCacheSize, int frogDBCacheSize) {
    if (frogDBCacheSize >= 100 ||
        memCacheSize >= 100 ||
        DateTime.now().millisecondsSinceEpoch - lastPostTime >
            minPostTimeInterval) {
      lastPostTime = DateTime.now().millisecondsSinceEpoch;
      return true;
    }
    return false;
  }

  @override
  int getFrogDBPostLimit() {
    return 100;
  }
}
