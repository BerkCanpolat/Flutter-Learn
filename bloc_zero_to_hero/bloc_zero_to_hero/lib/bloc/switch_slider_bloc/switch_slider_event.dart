part of 'switch_slider_bloc.dart';

sealed class SwitchSliderEvent extends Equatable {
  const SwitchSliderEvent();

  @override
  List<Object> get props => [];
}

class OnOreOffEvent extends SwitchSliderEvent{}

class SliderEvent extends SwitchSliderEvent{
  final double eventSlider;
  const SliderEvent(this.eventSlider);

  @override
  // TODO: implement props
  List<Object> get props => [eventSlider];
}
