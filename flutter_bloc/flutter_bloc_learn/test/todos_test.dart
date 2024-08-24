import 'package:flutter_bloc_learn/Bloc_MVVM/feature/home/model/todos.dart';
import 'package:flutter_bloc_learn/Bloc_MVVM/feature/home/service/todo_service.dart';
import 'package:flutter_bloc_learn/Bloc_MVVM/product/utils/service/dio_service_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TodosTest', () async {
    final service = DioServiceManager<List<dynamic>>();

    const baseUrl = 'https://jsonplaceholder.typicode.com/todos/';

    final response = await service.get(baseUrl);
    final data = response.data?.map((e) => Todos.fromJson(e)).cast<Todos>().toList();
    expect(data, isNotEmpty);
  });


  test('TodosService', () async {
    final service = TodoService(DioServiceManager());
    final response = await service.getTodos();

    expect(response.data, isNotEmpty);
  });
}