import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_clean_architecture_login_api/data/exception/app_exception.dart';
import 'package:bloc_clean_architecture_login_api/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkServiceApi implements BaseApiServices {
  @override
  Future deleteApi(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http.delete(Uri.parse(url)).timeout(const Duration(seconds: 50));
      jsonResponse = returnResponse(response);
      if(response.statusCode == 200) {

      }
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Time out try again');
    }
    return jsonResponse;
  }

  @override
  Future getApi(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 50));
      jsonResponse = returnResponse(response);
      if(response.statusCode == 200) {

      }
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Time out try again');
    }
    return jsonResponse;
  }

  @override
  Future postApi(String url, data) async {
     dynamic jsonResponse;
    try {
      final response = await http.post(Uri.parse(url), body: data).timeout(const Duration(seconds: 50));
      jsonResponse = returnResponse(response);
      if(response.statusCode == 200) {

      }
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Time out try again');
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch(response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 401:
        throw UnauthorisedException();
      case 500:
        throw FetchDataException('Error Communicating With Server ${response.statusCode}');
      default:
        throw UnauthorisedException();
    }
  }

}