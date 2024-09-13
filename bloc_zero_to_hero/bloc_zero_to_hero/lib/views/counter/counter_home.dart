import 'package:bloc_zero_to_hero/bloc/counter_bloc/bloc_counter.dart';
import 'package:bloc_zero_to_hero/bloc/counter_bloc/bloc_counter_event.dart';
import 'package:bloc_zero_to_hero/bloc/counter_bloc/bloc_counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterHome extends StatelessWidget {
  const CounterHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Bloc View'),
      ),
      body: Column(
        children: [
          BlocBuilder<BlocCounter, BlocCounterState>(
            builder: (context, state) {
              return Text(state.counter.toString());
            },
          ),
          ElevatedButton(onPressed: (){
            context.read<BlocCounter>().add(CounterEvent());
          }, child: Text('Increment')),
          ElevatedButton(onPressed: (){
            context.read<BlocCounter>().add(CounterRemoveEvent());
          }, child: Text('Deincrement')),
        ],
      ),
    );
  }
}