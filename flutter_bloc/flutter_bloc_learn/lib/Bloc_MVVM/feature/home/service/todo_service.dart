import 'package:flutter_bloc_learn/Bloc_MVVM/feature/home/model/todos.dart';
import 'package:flutter_bloc_learn/Bloc_MVVM/product/base/model/base_response_model.dart';
import 'package:flutter_bloc_learn/Bloc_MVVM/product/utils/service/iservice_manager.dart';

final class TodoService {
  final IserviceManager<List<dynamic>> _iserviceManager;

  TodoService(this._iserviceManager);

  final _baseUrl = 'https://jsonplaceholder.typicode.com/todos/';

  Future<BaseResponseModel<List<Todos>>> getTodos() async {
    final response = await _iserviceManager.get(_baseUrl);
    if(response.data != null) {
      //parse ediyoruz.
      final data = response.data?.map((e) => Todos.fromJson(e)).cast<Todos>().toList();
      return BaseResponseModel(data: data);
    } else {
      return BaseResponseModel(error: response.error);
    }
  }
}