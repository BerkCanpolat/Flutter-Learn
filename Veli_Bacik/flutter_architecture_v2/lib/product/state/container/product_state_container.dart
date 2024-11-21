import 'package:core/core.dart';
import 'package:flutter_architecture_v2/product/init/cache/product_cache.dart';
import 'package:flutter_architecture_v2/product/service/product_service_manager.dart';
import 'package:flutter_architecture_v2/product/state/view_model/product_view_model.dart';
import 'package:get_it/get_it.dart';

/// Product container for dependency injection
final class ProductStateContainer {
  const ProductStateContainer._();

  /// Product core required items
  static final _getIt = GetIt.I;
  static void setup() {
    _getIt
    ..registerSingleton(ProductCache(cacheManager: HiveCacheManager()))
    ..registerSingleton<ProductServiceManager>(ProductServiceManager.base())
    ..registerLazySingleton<ProductViewModel>(ProductViewModel.new);
  }

  static T read<T extends Object>() => _getIt<T>();
}