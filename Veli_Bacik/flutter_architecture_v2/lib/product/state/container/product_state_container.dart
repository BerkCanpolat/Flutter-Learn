import 'package:flutter_architecture_v2/product/service/product_service_manager.dart';
import 'package:get_it/get_it.dart';

/// Product container for dependency injection
final class ProductStateContainer {
  const ProductStateContainer._();

  /// Product core required items
  static final _getIt = GetIt.I;
  static void setup() {
    _getIt.registerSingleton<ProductServiceManager>(ProductServiceManager.base());
  }

  static T read<T extends Object>() => _getIt<T>();
}