import 'package:flutter/material.dart';

class YSayfasi extends StatefulWidget {
  const YSayfasi({super.key});

  @override
  State<YSayfasi> createState() => _YSayfasiState();
}

class _YSayfasiState extends State<YSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Y SAYFASI"),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.popUntil(context, (value) => value.isFirst);
        },
        child: Text(
          "Anasayfaya Dön",
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
      ),
    );
  }
}
