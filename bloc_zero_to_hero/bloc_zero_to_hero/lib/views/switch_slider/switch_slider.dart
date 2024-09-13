import 'package:bloc_zero_to_hero/bloc/switch_slider_bloc/switch_slider_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchSlider extends StatelessWidget {
  const SwitchSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch Slider View'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Notifications'),
              BlocBuilder<SwitchSliderBloc, SwitchSliderState>(
                buildWhen: (previous, current) => previous.isSwitch != current.isSwitch,
                builder: (context, state) {
                  print('Notificafitons');
                  return Switch(value: state.isSwitch, onChanged: (value) {
                    context.read<SwitchSliderBloc>().add(OnOreOffEvent());
                  },);
                },
              ),
            ],
          ),
          BlocBuilder<SwitchSliderBloc, SwitchSliderState>(
            buildWhen: (previous, current) => previous.isSlider != current.isSlider,
            builder: (context, state) {
              print('Container');
              return Container(
                color: Colors.black.withOpacity(state.isSlider),
                width: 300,
                height: 200,
              );
            },
          ),
          BlocBuilder<SwitchSliderBloc,SwitchSliderState>(
            buildWhen: (previous, current) => previous.isSlider != current.isSlider,
            builder: (context, state) {
              print('Slider');
              return Slider(value: state.isSlider, onChanged: (value) {
                context.read<SwitchSliderBloc>().add(SliderEvent(value));
              },);
            },
          )
        ],
      ),
    );
  }
}