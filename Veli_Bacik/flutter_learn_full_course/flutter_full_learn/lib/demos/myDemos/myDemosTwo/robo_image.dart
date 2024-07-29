import 'package:flutter/material.dart';

class RoboImage extends StatelessWidget {
  const RoboImage({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Image.asset(_customRoboImage, scale: 2,);
  }

  String get _customRoboImage => 'assets/$path.webp';
}

class RoboImagePath {
  static const roboImage = 'robot';
}