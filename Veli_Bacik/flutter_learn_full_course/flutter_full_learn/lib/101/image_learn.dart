import 'package:flutter/material.dart';

class ImageLearnView extends StatelessWidget {
  const ImageLearnView({super.key});
  final String _imagePath = 'https://cdn4.iconfinder.com/data/icons/science-30/293/science_74-512.png';

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
          Image.network(
            _imagePath,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
            height: 200,
            )
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