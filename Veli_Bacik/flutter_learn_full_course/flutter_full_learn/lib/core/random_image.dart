import 'package:flutter/material.dart';

class RandomImage extends StatelessWidget {
  const RandomImage({super.key, this.heightProperty = 100});
  final imageUrl = 'https://picsum.photos/200/300';
  final double heightProperty;

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl, fit: BoxFit.cover, height: 100,);
  }
}