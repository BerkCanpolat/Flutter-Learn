import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_learn/Bloc_MVVM/product/base/model/base_response_model.dart';
import 'package:flutter_bloc_learn/Bloc_MVVM/product/utils/service/iservice_manager.dart';

//BURASI ANA KATMAN

final class DioServiceManager<T> extends IserviceManager<T> {

  late final Dio _dio;

  DioServiceManager() {
    _dio = Dio();
  }

  @override
  Future<BaseResponseModel<T>> get(String url) async {
    // TODO: implement get
    try {
      final response = await _dio.get(url);
      if(response.statusCode == HttpStatus.ok) {
        //Data dioda direkt decode edilmiş halde gelir.
        return BaseResponseModel(data: response.data);
      }
      return BaseResponseModel(error: response.statusMessage);
    }on DioException catch (e) {
      return BaseResponseModel(error: e.message);
    }
  }

}