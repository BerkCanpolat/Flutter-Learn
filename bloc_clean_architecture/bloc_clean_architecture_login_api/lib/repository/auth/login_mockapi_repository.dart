import 'package:bloc_clean_architecture_login_api/models/user/user_models.dart';
import 'package:bloc_clean_architecture_login_api/repository/auth/login_repository.dart';

class LoginMockApiRepository implements LoginRepository{

  @override
  Future<UserModels> loginRepoApi(dynamic data) async {
    await Future.delayed(const Duration(seconds: 3));
    final response = {
      'token': 'QpwL5tke4Pnpja7X4'
    };
    return UserModels.fromJson(response);
  }
}