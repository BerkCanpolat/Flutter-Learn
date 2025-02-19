import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_architecture_v2/product/init/config/app_environment.dart';
import 'package:vexana/vexana.dart';

/// Product network manager
final class ProductServiceManager extends NetworkManager<EmptyModel>{
  /// initialize
  ProductServiceManager.base():super(
    options: BaseOptions(baseUrl: AppEnvironmentItems.baseUrl.value, ),

  );

  /// Handle Error
  /// /// [onErrorStatus] in error status cide [HttpStatus]
  void listenErrorState({required ValueChanged<int> onErrorStatus}){
    interceptors.add(InterceptorsWrapper(
      onError: (error, handler) {
        // print('Error: ${error.message}');
        onErrorStatus(error.response?.statusCode ?? HttpStatus.notFound);
        return handler.next(error);
      },
    ));
  }
}