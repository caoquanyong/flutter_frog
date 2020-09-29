import 'package:flutter_frog/core/impl/frog_impl.dart';
import 'package:flutter_frog/core/impl/frog_post_policy_impl.dart';
import 'package:flutter_frog/core/impl/frog_poster_impl.dart';
import 'package:flutter_frog/core/impl/frog_store_impl.dart';
import 'package:flutter_frog/core/interfaces/frog_interfaces.dart';

typedef DoPost = Future<void> Function(List<int> data);

class FrogBuilder {
  final IFrogStore _frogStore;
  final IFrogPoster _frogPoster;
  final IFrogPostPolicy _frogPostPolicy;

  ///
  /// The DoPost is only needed when you use the default impl of IFrogPoster---IFrogPosterImpl;
  /// when you impl you own IFrogPoster，Don't add  DoPost,it will be useless.
  ///

  FrogBuilder(
      {IFrogStore frogPoster,
      IFrogPoster frogStore,
      IFrogPostPolicy frogPostPolicy,
      DoPost doPost})
      : assert((frogPoster == null && doPost != null) ||
            (frogPoster != null && doPost == null)),
        _frogStore = frogStore ?? FrogStoreImpl(),
        _frogPoster = frogPoster ?? FrogPosterImpl(doPost),
        _frogPostPolicy = frogPostPolicy ?? FrogPostPolicyImpl();

  IFrog build() {
    return FrogImpl(_frogStore, _frogPoster, _frogPostPolicy);
  }
}
