import 'package:flutter_bloc_learn/Bloc_MVVM/product/base/model/base_response_model.dart';

abstract class IserviceManager<T> {
  Future<BaseResponseModel<T>> get(String url);
}