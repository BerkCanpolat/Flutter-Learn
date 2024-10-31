import 'dart:convert';
import 'dart:io';

import 'package:bloc_api/bloc_user_api_project/user_model/user_model.dart';
import 'package:http/http.dart';
class UserRepository {
  String endPoint = 'https://reqres.in/api/users?page=2';

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(endPoint));
    if(response.statusCode == HttpStatus.ok) {
      final List list = jsonDecode(response.body)['data'];
      return list.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}