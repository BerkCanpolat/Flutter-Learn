import 'package:flutter/material.dart';

const apiKey = "6d590066a434d86c661b4ea07fa618e8";
const kBackgroundColor = Colors.black;
const imageUrl = "https://image.tmdb.org/t/p/w500";


String getImageUrl(String? path) {
  if (path == null || path.isEmpty) {
    return 'https://via.placeholder.com/500x750?text=No+Image';
  }
  return 'https://image.tmdb.org/t/p/w500$path';
}
