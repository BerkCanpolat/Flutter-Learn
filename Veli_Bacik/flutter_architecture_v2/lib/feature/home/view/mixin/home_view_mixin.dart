import 'package:flutter_architecture_v2/feature/home/view/home_view.dart';
import 'package:flutter_architecture_v2/feature/home/view_model/home_view_model.dart';
import 'package:flutter_architecture_v2/product/service/login_service.dart';
import 'package:flutter_architecture_v2/product/service/manager/product_network_error_manager.dart';
import 'package:flutter_architecture_v2/product/state/base/base_state.dart';
import 'package:flutter_architecture_v2/product/state/container/product_state_Items.dart';


/// Manage your home screen view business logic
mixin HomeViewMixin on BaseState<HomeView> {
  // late final ProductServiceManager productServiceManager;
  //late final LoginService _loginService;
  late final ProductNetworkErrorManager _productNetworkErrorManager;
  late final HomeViewModel _homeViewModel;

  HomeViewModel get homeViewModel => _homeViewModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // productServiceManager = ProductServiceManager.base();
    //loginService = LoginService(ProductStateItems.productServiceManager);
    _productNetworkErrorManager = ProductNetworkErrorManager(context);

    ProductStateItems.productServiceManager.listenErrorState(onErrorStatus: _productNetworkErrorManager.handleError);

    _homeViewModel = HomeViewModel(operationService: LoginService(productServiceManager), userCacheOperation: ProductStateItems.productCache.userCacheOperation);

    _homeViewModel.fetchUsers();
  }
}