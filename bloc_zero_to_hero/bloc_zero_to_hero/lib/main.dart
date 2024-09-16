import 'package:bloc_zero_to_hero/bloc/counter_bloc/bloc_counter.dart';
import 'package:bloc_zero_to_hero/bloc/fav_bloc/fav_bloc.dart';
import 'package:bloc_zero_to_hero/bloc/image_picker_bloc/image_bloc.dart';
import 'package:bloc_zero_to_hero/bloc/post_bloc/post_bloc.dart';
import 'package:bloc_zero_to_hero/bloc/switch_slider_bloc/switch_slider_bloc.dart';
import 'package:bloc_zero_to_hero/repository/fav_repository.dart';
import 'package:bloc_zero_to_hero/utility/image_utility.dart';
import 'package:bloc_zero_to_hero/views/login_page/login_view.dart';
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
        BlocProvider(create: (context) => SwitchSliderBloc()),
        BlocProvider(create: (context) => ImageBloc(ImageUtility())),
        BlocProvider(create: (context) => FavBloc(FavRepository())),
        BlocProvider(create: (context) => PostBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginView()
      ),
    );
  }
}