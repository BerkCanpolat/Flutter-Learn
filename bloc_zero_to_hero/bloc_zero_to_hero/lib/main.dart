import 'package:bloc_zero_to_hero/bloc/counter_bloc/bloc_counter.dart';
import 'package:bloc_zero_to_hero/bloc/switch_slider_bloc/switch_slider_bloc.dart';
import 'package:bloc_zero_to_hero/views/counter/counter_home.dart';
import 'package:bloc_zero_to_hero/views/switch_slider/switch_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BlocCounter()),
        BlocProvider(create: (context) => SwitchSliderBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SwitchSlider()
      ),
    );
  }
}