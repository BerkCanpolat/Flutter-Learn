import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_architecture/core/base/model/base_model.dart';
import 'package:flutter_architecture/core/constants/enums/locale_keys_enum.dart';
import 'package:flutter_architecture/core/init/cache/locale_manager.dart';

class NetworkManager {
    NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      headers: {'val': LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)},
    );
    // _dio = Dio(baseOptions);

    // coreDio = CoreDio(baseOptions);

    dio = Dio(baseOptions);

    Future dioGet<T extends BaseModel> (String path, T model) async{
      final response = await dio?.get(path);

      switch(response?.statusCode) {
        case HttpStatus.ok:
          final responseBody = response?.data;
          if(responseBody is List) {
            return responseBody.map((e) => model.fromJson(e)).toList();
          } else if(responseBody is Map) {

          } 
          return responseBody;
          default:
      }
    }

    

    // _dio.interceptors.add(InterceptorsWrapper(
    //   onRequest: (options) {
    //     options.path += "veli";
    //   },
    //   onError: (e) {
    //     return BaseError(e.message);
    //   },
    // ));
  }
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }
  Dio? dio;
}