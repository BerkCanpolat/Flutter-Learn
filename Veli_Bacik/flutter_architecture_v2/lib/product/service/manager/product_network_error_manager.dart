import 'dart:io';

import 'package:flutter/material.dart';

/// Manage your network error with screen
final class ProductNetworkErrorManager {
  final BuildContext context;
  ProductNetworkErrorManager(this.context);

  void handleError(int value) {
    if(value == HttpStatus.unauthorized) {

    }
  }
}



// final class ProductNetworkErrorManager {
//   final BuildContext context;
//   ProductNetworkErrorManager(this.context);

//   void handleError(int value) {
//     if (value == HttpStatus.unauthorized) {
//       // Kullanıcı oturumu geçersizse (401)
//       print('Unauthorized error');
//       // Burada oturum açma ekranına yönlendirme yapılabilir
//     } else if (value == HttpStatus.notFound) {
//       // İstek için doğru uç nokta bulunamadıysa (404)
//       print('Not Found error');
//       // Burada bir hata mesajı gösterebilirsin
//     } else {
//       // Diğer durum kodları için
//       print('Error: $value');
//     }
//   }
// }
