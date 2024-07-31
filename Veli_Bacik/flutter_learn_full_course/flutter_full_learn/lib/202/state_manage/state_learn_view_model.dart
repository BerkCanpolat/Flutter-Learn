import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/state_manage/state_mange_learn_view.dart';

abstract class StateLearnViewModel extends State<StateMangeLearnView> {
  bool isVisible = false;
  bool isOpacity = false;

  void changeVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void changeOpacity() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }
}
