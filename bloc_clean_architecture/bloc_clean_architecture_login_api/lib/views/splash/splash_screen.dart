import 'package:bloc_clean_architecture_login_api/service/splash/splash_service.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService _splashService = SplashService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashService.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('SPLASH SCREEN')
        ),
      ),
    );
  }
}