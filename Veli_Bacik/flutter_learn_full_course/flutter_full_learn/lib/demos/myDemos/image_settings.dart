import 'package:flutter/material.dart';
import 'package:flutter_full_learn/demos/myDemos/myCore/my_core.dart';

class ImageSettings extends StatelessWidget {
  const ImageSettings({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Image.asset(_image, height: MailDemosSize.imageSize,);
  }

  String get _image => 'assets/$path.png';
}

class ImagePathDemos {
  static const String mailImage = 'mail';
}