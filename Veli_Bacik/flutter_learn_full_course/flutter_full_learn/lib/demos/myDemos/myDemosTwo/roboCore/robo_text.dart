import 'package:flutter/material.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/robo_colors.dart';

class RoboText extends StatelessWidget {
  const RoboText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: RoboColors.roboTextColor,
          fontWeight: FontWeight.bold,
          fontSize: 37),
    );
  }
}
