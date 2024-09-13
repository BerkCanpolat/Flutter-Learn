part of 'switch_slider_bloc.dart';

class SwitchSliderState extends Equatable {
  final bool isSwitch;
  final double isSlider;
  const SwitchSliderState({this.isSwitch = false, this.isSlider = 1.0});

  SwitchSliderState copyWith({
    bool? isSwitch,
    double? isSlider
  }) {
    return SwitchSliderState(
      isSwitch: isSwitch ?? this.isSwitch,
      isSlider: isSlider ?? this.isSlider
    );
  }
  
  @override
  List<Object> get props => [isSwitch, isSlider];
}