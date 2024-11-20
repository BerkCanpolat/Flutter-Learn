
import 'package:flutter_architecture_v2/product/service/product_service_manager.dart';
import 'package:flutter_architecture_v2/product/state/container/product_state_container.dart';
import 'package:flutter_architecture_v2/product/state/view_model/product_view_model.dart';

final class ProductStateItems {
  const ProductStateItems._();

  static ProductServiceManager get productServiceManager => ProductStateContainer.read<ProductServiceManager>();

  static ProductViewModel get productViewModel => ProductStateContainer.read<ProductViewModel>();
}