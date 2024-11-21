import 'package:flutter/material.dart';
import 'package:flutter_architecture_v2/product/service/product_service_manager.dart';
import 'package:flutter_architecture_v2/product/state/container/product_state_Items.dart';
import 'package:flutter_architecture_v2/product/state/view_model/product_view_model.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ProductServiceManager get productServiceManager => ProductStateItems.productServiceManager;

  ProductViewModel get productViewModel => ProductStateItems.productViewModel;
}