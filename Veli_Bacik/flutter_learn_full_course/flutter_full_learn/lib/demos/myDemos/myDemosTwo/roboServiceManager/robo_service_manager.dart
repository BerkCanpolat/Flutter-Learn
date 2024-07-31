import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboModel/robo_service_model.dart';

abstract class RoboAbstractClass {
  Future<List<RoboApiModel>?> roboGetItems();
}

class RoboServiceManager implements RoboAbstractClass{
  final Dio _roboDio;
  RoboServiceManager() : _roboDio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<List<RoboApiModel>?> roboGetItems() async{
    try {
      final response = await _roboDio.get(_RoboApiEnum.posts.name);
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => RoboApiModel.fromJson(e)).toList();
        }
      }
    } on DioException catch (e) {
      _RoboErrorException.roboError(e);
    }
  }
}

enum _RoboApiEnum {
  posts
}

class _RoboErrorException {
  static void roboError(DioException error) {
    if(kDebugMode) {
      print(error.message);
    }
  }
}