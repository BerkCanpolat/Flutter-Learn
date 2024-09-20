import 'package:bloc_clean_architecture_login_api/config/routes/routes_name.dart';
import 'package:bloc_clean_architecture_login_api/service/storage/local_storage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(onPressed: (){
            LocalStorage localStorage = LocalStorage();
            localStorage.clearValue('token').then((value) {
              Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route) => false,);
            });
          }, icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}