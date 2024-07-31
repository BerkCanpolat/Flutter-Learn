import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/state_manage/state_learn_view_model.dart';

class StateMangeLearnView extends StatefulWidget {
  const StateMangeLearnView({super.key});

  @override
  State<StateMangeLearnView> createState() => _StateMangeLearnViewState();
}

class _StateMangeLearnViewState extends StateLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        changeVisible();
      }),
      appBar: AppBar(
        backgroundColor: isOpacity ? Colors.red : Colors.green,
        shadowColor: isVisible ? Colors.amber : Colors.grey,
      ),
    );
  }
}