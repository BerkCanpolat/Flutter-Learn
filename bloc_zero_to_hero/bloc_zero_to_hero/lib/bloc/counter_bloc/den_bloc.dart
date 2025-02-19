import 'package:bloc_zero_to_hero/bloc/counter_bloc/den_event.dart';
import 'package:bloc_zero_to_hero/bloc/counter_bloc/den_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DenBloc extends Bloc<DenEvent, DenState>{
  DenBloc() : super(const DenState()) {
    on<ToplamGoster>(_incrementToplam);
    on<ToplamCikart>(_incrementCikart);
  }

  void _incrementToplam(ToplamGoster event, Emitter<DenState> emit) {
    if(state.counter == null) {
      emit(state.copyWith(counter: state.counter ?? 0));
    } else {
      emit(state.copyWith(counter: state.counter! + 1));
    }
  }

  void _incrementCikart(ToplamCikart event, Emitter<DenState> emit) {
    if(state.counter! > 0) {
      emit(state.copyWith(counter: state.counter! - 1));
    }
  }


}