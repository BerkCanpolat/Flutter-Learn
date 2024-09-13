import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_zero_to_hero/bloc/counter_bloc/bloc_counter_event.dart';
import 'package:bloc_zero_to_hero/bloc/counter_bloc/bloc_counter_state.dart';

class BlocCounter extends Bloc<BlocCounterEvent, BlocCounterState> {
  BlocCounter() : super(const BlocCounterState()) {
    on<CounterEvent>(_incrementCounter,);
    on<CounterRemoveEvent>((event, emit) {
      if(state.counter! > 0) {
        emit(state.copyWith(counter: state.counter! - 1));
      }
    },);
  }

  FutureOr<void> _incrementCounter(event, emit) {
    if(state.counter == null) {
      emit(state.copyWith(counter: state.counter ?? 0));
    } else {
      emit(state.copyWith(counter: state.counter! + 1));
    }
  }
}