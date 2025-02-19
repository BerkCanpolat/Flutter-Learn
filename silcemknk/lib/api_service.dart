import 'dart:convert';

import 'package:silcemknk/constant.dart';
import 'package:silcemknk/model.dart';
import 'package:http/http.dart' as http;

class ApiService {

  Future<List<Model?>>? apiServiceGet() async {
    final urii = Uri.parse(baseUrl);

    final response = await http.get(urii);

    if(response.statusCode == 200) {
      final List<dynamic> apiList = json.decode(response.body);

      return apiList.map((e) => Model.fromJson(e)).toList();
    } else {
      throw Exception('');
    }
  }
}