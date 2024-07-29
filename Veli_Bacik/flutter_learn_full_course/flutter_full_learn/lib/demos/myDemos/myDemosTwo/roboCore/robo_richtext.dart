import 'package:flutter/material.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/robo_colors.dart';

class RoboRichtext extends StatelessWidget {
  const RoboRichtext({super.key, required this.titleHead, required this.titleSub});
  final String titleHead;
  final String titleSub;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: titleHead,
          style: const TextStyle(color: RoboColors.roboSignRichTextColor, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: titleSub,
                style: const TextStyle(
                    color: RoboColors.roboSignOrText,
                    fontWeight: FontWeight.bold)),
          ]),
    );
  }
}
