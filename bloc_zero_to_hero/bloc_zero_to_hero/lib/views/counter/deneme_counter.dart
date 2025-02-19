import 'package:bloc_zero_to_hero/bloc/counter_bloc/den_bloc.dart';
import 'package:bloc_zero_to_hero/bloc/counter_bloc/den_event.dart';
import 'package:bloc_zero_to_hero/bloc/counter_bloc/den_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DenemeCounter extends StatefulWidget {
  const DenemeCounter({super.key});

  @override
  State<DenemeCounter> createState() => _DenemeCounterState();
}

class _DenemeCounterState extends State<DenemeCounter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<DenBloc, DenState>(
              builder: (context, state) {
                return Text(state.counter.toString());
              },
            ),
            ElevatedButton(onPressed: (){
              context.read<DenBloc>().add(ToplamGoster());
            }, child: Text('ARttır')),
            ElevatedButton(onPressed: (){
              context.read<DenBloc>().add(ToplamCikart());
            }, child: Text('Çıkart')),
          ],
        ),
      ),
    );
  }
}