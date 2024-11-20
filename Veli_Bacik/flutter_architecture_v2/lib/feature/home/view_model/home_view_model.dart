import 'package:flutter_architecture_v2/feature/home/view_model/state/home_state.dart';
import 'package:flutter_architecture_v2/product/service/interface/authenction_operation.dart';
import 'package:flutter_architecture_v2/product/state/base/base_cubit.dart';

/// Manage your home view business logic
final class HomeViewModel extends BaseCubit<HomeState>{

  /// [AuthenctionOperation] service
  HomeViewModel({required AuthenctionOperation operationService}):  _authenctionOperationService = operationService, super(const HomeState(isLoading: false));
  late final AuthenctionOperation _authenctionOperationService;

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// Get Users
  Future<void> fetchUsers() async {
    final response = await _authenctionOperationService.users();
    emit(state.copyWith(users: response));
  }
}