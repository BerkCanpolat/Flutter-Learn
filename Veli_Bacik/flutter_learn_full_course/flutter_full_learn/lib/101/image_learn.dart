import 'package:flutter/material.dart';

class ImageLearnView extends StatelessWidget {
  const ImageLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: 300,
            child: PngImage(path: ImageItems().appleBookWithouthPath)
          ),
        ],
      ),
    );
  }
}

class ImageItems {
  final String appleWithBook = 'assets/apple.webp';
  final String appleBookWithouthPath = 'apple';
}

class PngImage extends StatelessWidget {
  const PngImage({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Image.asset(_nameWithPath,fit: BoxFit.cover,);
  }

  String get _nameWithPath => 'assets/$path.webp';
}