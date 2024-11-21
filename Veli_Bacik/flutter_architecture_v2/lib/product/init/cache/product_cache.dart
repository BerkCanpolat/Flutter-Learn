import 'package:core/core.dart';
import 'package:flutter_architecture_v2/product/init/cache/model/user_cache_model.dart';

final class ProductCache {
  ProductCache({required CacheManager cacheManager}) : _cacheManager = cacheManager;

  final CacheManager _cacheManager;

  Future<void> init() async {
    await _cacheManager.init(
      items: [
        UserCacheModel.empty()
      ]
    );
  }
  late final HiveCacheOperation<UserCacheModel> userCacheOperation = HiveCacheOperation<UserCacheModel>();
}