import 'package:bloc_api/bloc_user_api_project/user_model/user_model.dart';
import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  final UserModel user;
  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.first_name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.avatar),
              maxRadius: 90,
            ),
          ),
          Text(user.email),
        ],
      ),
    );
  }
}