import 'package:core/core.dart';
import 'package:flutter_architecture_v2/feature/home/view_model/state/home_state.dart';
import 'package:flutter_architecture_v2/product/init/cache/model/user_cache_model.dart';
import 'package:flutter_architecture_v2/product/service/interface/authenction_operation.dart';
import 'package:flutter_architecture_v2/product/state/base/base_cubit.dart';
import 'package:gen/gen.dart';

/// Manage your home view business logic
final class HomeViewModel extends BaseCubit<HomeState>{

  /// [AuthenctionOperation] service
  HomeViewModel({required AuthenctionOperation operationService,
  required HiveCacheOperation<UserCacheModel> userCacheOperation
  }):  _authenctionOperationService = operationService, _userCacheOperation = userCacheOperation, super(const HomeState(isLoading: false));

  final AuthenctionOperation _authenctionOperationService;
  final HiveCacheOperation<UserCacheModel> _userCacheOperation;

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// Get Users
  Future<void> fetchUsers() async {
    print(users);
    final response = await _authenctionOperationService.users();
    _saveItems(response);
    emit(state.copyWith(users: response));
  }

  /// Dummy
  void _saveItems(List<User> user) {
    user.forEach((element) {
      _userCacheOperation.add(UserCacheModel(user: element));
    });
  }

  List<User> get users => _userCacheOperation.getAll().map((e) => e.user).toList();
}