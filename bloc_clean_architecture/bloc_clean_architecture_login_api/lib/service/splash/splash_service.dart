import 'dart:async';

import 'package:bloc_clean_architecture_login_api/config/routes/routes_name.dart';
import 'package:bloc_clean_architecture_login_api/service/sesion_manager/session_controller.dart';
import 'package:flutter/material.dart';

class SplashService {
  void isLogin(BuildContext context) {
    SessionController().getUserFromPreference().then((value) {
      if(SessionController().isLogin ?? false) {
        Timer(const Duration(seconds: 3), () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.homeScreen, (route) => false));
      } else {
        Timer(const Duration(seconds: 3), () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route) => false));
      }
    }).onError((error, stackTrace) {
    Timer(const Duration(seconds: 3), () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route) => false));
      
    },);
  }
}