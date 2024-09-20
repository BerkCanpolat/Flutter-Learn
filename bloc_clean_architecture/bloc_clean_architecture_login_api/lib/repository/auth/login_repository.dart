import 'package:bloc_clean_architecture_login_api/config/app_url.dart';
import 'package:bloc_clean_architecture_login_api/data/network/network_service_api.dart';
import 'package:bloc_clean_architecture_login_api/models/user/user_models.dart';

class LoginRepository {
  final _api = NetworkServiceApi();

  Future<UserModels> loginRepoApi(dynamic data) async {
    final response = await _api.postApi(AppUrl.appUrl, data);
    return UserModels.fromJson(response);
  }
}