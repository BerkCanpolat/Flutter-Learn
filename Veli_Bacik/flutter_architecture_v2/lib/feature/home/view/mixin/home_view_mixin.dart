import 'package:flutter/material.dart';
import 'package:flutter_architecture_v2/feature/home/view/home_view.dart';
import 'package:flutter_architecture_v2/product/service/login_service.dart';
import 'package:flutter_architecture_v2/product/service/manager/product_network_error_manager.dart';
import 'package:flutter_architecture_v2/product/state/container/product_state_Items.dart';


/// Manage your home screen view business logic
mixin HomeViewMixin on State<HomeView> {
  // late final ProductServiceManager productServiceManager;
  late final LoginService loginService;
  late final ProductNetworkErrorManager productNetworkErrorManager;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // productServiceManager = ProductServiceManager.base();
    loginService = LoginService(ProductStateItems.productServiceManager);
    productNetworkErrorManager = ProductNetworkErrorManager(context);

    ProductStateItems.productServiceManager.listenErrorState(onErrorStatus: productNetworkErrorManager.handleError);
  }
}