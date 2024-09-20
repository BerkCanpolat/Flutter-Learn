import 'dart:convert';

import 'package:bloc_clean_architecture_login_api/models/user/user_models.dart';
import 'package:bloc_clean_architecture_login_api/service/storage/local_storage.dart';

class SessionController {
  static final SessionController _session = SessionController._internal();

  final LocalStorage localStorage = LocalStorage();
  UserModels user = UserModels();
  bool? isLogin;

  SessionController._internal() {
    isLogin = false;
  }

  factory SessionController() {
    return _session;
  }

  Future<void> saveUserInPreferences(dynamic user) async {
    localStorage.setValue('token', jsonEncode(user));
    localStorage.setValue('isLogin', 'true');
  }

  Future<void> getUserFromPreference() async {
    try {
      var userData = await localStorage.readValue('token');
      var isLogin = await localStorage.readValue('isLogin');
      if(userData.isNotEmpty) {
        SessionController().user = UserModels.fromJson(jsonDecode(userData));
      }
      SessionController().isLogin = isLogin == 'true' ? true : false;
    } catch (e) {
      print(e.toString());
    }
  }
}