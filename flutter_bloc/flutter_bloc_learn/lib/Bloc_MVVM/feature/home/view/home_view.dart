import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/Bloc_MVVM/feature/home/bloc/home_block.dart';
import 'package:flutter_bloc_learn/Bloc_MVVM/feature/home/model/todos.dart';
import 'package:flutter_bloc_learn/Bloc_MVVM/feature/home/service/todo_service.dart';
import 'package:flutter_bloc_learn/Bloc_MVVM/product/utils/service/dio_service_manager.dart';

part 'src/_listView_builder.dart';
part 'src/_error_field.dart';
part 'src/_loading_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBlock(TodoService(DioServiceManager()))..add(FetchTodosEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Todos'),
        ),
        body: const _PageBuilder(),
      ),
    );
  }
}

class _PageBuilder extends StatelessWidget {
  const _PageBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBlock, HomeState>(builder: (context, state) {
      if (state.error != null && state.error!.isNotEmpty) {
        return _ErrorField(error: state.error!,);
      } else if (state.todos != null && state.todos!.isNotEmpty) {
        return _ListViewBuilder(todos: state.todos!,);
      }
      return const _LoadingField();
    });
  }
}


