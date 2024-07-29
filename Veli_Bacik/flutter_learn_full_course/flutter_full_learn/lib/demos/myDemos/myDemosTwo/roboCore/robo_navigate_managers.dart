import 'package:flutter/material.dart';

mixin RoboNavigateManagers {
  void roboNavigate(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}