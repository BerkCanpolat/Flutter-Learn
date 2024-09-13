import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_slider_event.dart';
part 'switch_slider_state.dart';

class SwitchSliderBloc extends Bloc<SwitchSliderEvent, SwitchSliderState> {
  SwitchSliderBloc() : super(const SwitchSliderState()) {
    on<OnOreOffEvent>(_isSwitchMethod,);
    on<SliderEvent>((event, emit) {
      emit(state.copyWith(isSlider: event.eventSlider.toDouble()));
    },);
  }

  FutureOr<void> _isSwitchMethod(OnOreOffEvent event, Emitter<SwitchSliderState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
}
