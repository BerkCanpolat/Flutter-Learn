import 'dart:convert';
import 'dart:io';

import 'package:bloc_api/bloc_user_api_project/user_model/user_model.dart';
import 'package:http/http.dart' as http;
class UserRepository {
  String endPoint = 'https://reqres.in/api/users?page=2';

  Future<UserDataModel> getUsers() async {
    final response = await http.get(Uri.parse(endPoint));
    if(response.statusCode == HttpStatus.ok) {
      return UserDataModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}