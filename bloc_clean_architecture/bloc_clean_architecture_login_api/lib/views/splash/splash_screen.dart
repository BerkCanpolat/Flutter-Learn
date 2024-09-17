import 'package:bloc_clean_architecture_login_api/config/components/ethernet_exception_widget.dart';
import 'package:bloc_clean_architecture_login_api/config/components/loading_widget.dart';
import 'package:bloc_clean_architecture_login_api/config/components/round_button.dart';
import 'package:bloc_clean_architecture_login_api/config/routes/routes_name.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              EthernetExceptionWidget(onPress: (){}),
              RoundButton(title: 'Login', onPress: (){}),
              RoundButton(title: 'Sign Up', onPress: (){}),
              LoadingWidget(),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, RoutesName.homeScreen);
              }, child: Text('Home'))
            ],
          ),
        ),
      ),
    );
  }
}