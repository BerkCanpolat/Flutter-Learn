import 'package:bloc_cubit_odev_app/ui/cubit/anasayfa_cubit.dart';
import 'package:bloc_cubit_odev_app/ui/cubit/detay_cubit.dart';
import 'package:bloc_cubit_odev_app/ui/cubit/kayit_cubit.dart';
import 'package:bloc_cubit_odev_app/ui/views/anasayfa.dart';
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
        BlocProvider(create: (context) => KayitCubit()),
        BlocProvider(create: (context) => DetayCubit()),
        BlocProvider(create: (context) => AnasayfaCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Anasayfa()
      ),
    );
  }
}