import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';

abstract class IPostService {
  Future<bool> addItemToService(ServiceLearn serviceModel);
  Future<List<ServiceLearn>?> fetchPostItemsAdvance();
  Future<bool> deleteItemToService(int id);
  Future<bool> putItemToService(ServiceLearn serviceModel, int id);
}




class PostServiceManager implements IPostService {
  final Dio _dio;
  PostServiceManager()
      : _dio =
            Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));


  @override
  Future<bool> addItemToService(ServiceLearn serviceModel) async {
    try {
      final response =
          await _dio.post(_PostServicePath.posts.name, data: serviceModel);

      return response.statusCode == HttpStatus.created;
    } on DioException catch (error) {
      _ShowDebug.showDioError(error);
    }
    return false;
  }

  @override
  Future<List<ServiceLearn>?> fetchPostItemsAdvance() async {
    try {
      final response = await _dio.get(_PostServicePath.posts.name);
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          //BU listeyi yeni bir liste yapmaya çalışıyorum demek MAP.
          return _datas.map((e) => ServiceLearn.fromJson(e)).toList();
        }
      }
    } on DioException catch (e) {
      _ShowDebug.showDioError(e);
    }
    return null;
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response = await _dio.put('${_PostServicePath.posts.name}/$id');

      return response.statusCode == HttpStatus.ok;
    } on DioException catch (error) {
      _ShowDebug.showDioError(error);
    }
    return false;
  }


  @override
  Future<bool> putItemToService(ServiceLearn serviceModel, int id) async {
    try {
      final response = await _dio.put('${_PostServicePath.posts.name}/$id', data: serviceModel);

      return response.statusCode == HttpStatus.ok;
    } on DioException catch (error) {
      _ShowDebug.showDioError(error);
    }
    return false;
  }


  


}

enum _PostServicePath {
  posts,
  comment,
}


class _ShowDebug {
  static void showDioError(DioException error) {
          if (kDebugMode) {
        print(error.message);
      }
  }
}