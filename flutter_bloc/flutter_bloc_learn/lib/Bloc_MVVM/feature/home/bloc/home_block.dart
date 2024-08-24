import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/Bloc_MVVM/feature/home/model/todos.dart';
import 'package:flutter_bloc_learn/Bloc_MVVM/feature/home/service/todo_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBlock extends Bloc<HomeEvent, HomeState> {
  final TodoService _service;
  HomeBlock(this._service) : super(const HomeState()) {
    on<FetchTodosEvent>(_fetchTodos);
  }

  FutureOr<void> _fetchTodos(FetchTodosEvent event, Emitter<HomeState> emit) async {
    final response = await _service.getTodos();
    if(response.data != null && response.data!.isNotEmpty) {
      emit(state.copyWith(todos: response.data));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }
}