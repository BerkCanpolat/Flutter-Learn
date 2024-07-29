import 'package:flutter/material.dart';

class RoboButtonSpecial extends StatelessWidget {
  const RoboButtonSpecial({super.key, this.title, required this.voidCallback, required this.backColor, this.icon, this.borderRadius, required this.color, this.borderSide});
  final String? title;
  final VoidCallback voidCallback;
  final Color backColor;
  final Color color;
  final Icon? icon;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: voidCallback,
      label: Text(
        title ?? '',
        style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      icon: icon,
      style: 
          ElevatedButton.styleFrom(
            backgroundColor: backColor,
            side: borderSide,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(10))
            ),
            ),
    );
  }
}
