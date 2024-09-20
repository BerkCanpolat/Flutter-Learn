import 'package:bloc_clean_architecture_login_api/models/user/user_models.dart';

abstract class LoginRepository {

  Future<UserModels> loginRepoApi(dynamic data);
}