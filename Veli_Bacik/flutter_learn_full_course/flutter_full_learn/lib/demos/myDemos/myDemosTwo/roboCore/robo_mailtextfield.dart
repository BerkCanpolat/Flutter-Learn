import 'package:flutter/material.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/robo_colors.dart';

class RoboMailtextfield extends StatefulWidget {
  const RoboMailtextfield({super.key});

  @override
  State<RoboMailtextfield> createState() => _RoboMailtextfieldState();
}

class _RoboMailtextfieldState extends State<RoboMailtextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 217, 225, 232),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Mail Girin',
            hintStyle: TextStyle(color: RoboColors.roboSignOrText),
            prefixIcon: Icon(Icons.mail, color: RoboColors.roboSignTextColor, size: 30,)
          ),
        ),
      ),
    );
  }
}