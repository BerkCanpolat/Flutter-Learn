import 'package:altinci_gun/anasayfa.dart';
import 'package:altinci_gun/bottomnav_kullanimi/bottomnav_sayfa.dart';
import 'package:altinci_gun/kullanici_etkilesimi/kullanici_etkilesimi.dart';
import 'package:altinci_gun/odev/odev_anasayfa.dart';
import 'package:altinci_gun/widgets_kullanimi/widget_anasayfa.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WidgetAnasayfa()
    );
  }
}