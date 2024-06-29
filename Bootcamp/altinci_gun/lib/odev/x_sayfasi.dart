import 'package:altinci_gun/odev/y_sayfasi.dart';
import 'package:flutter/material.dart';

class XSayfasi extends StatefulWidget {
  const XSayfasi({super.key});

  @override
  State<XSayfasi> createState() => _XSayfasiState();
}

class _XSayfasiState extends State<XSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("X SAYFASI"),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => YSayfasi()));
        },
        child: Text(
          "Y Sayfasına git",
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
      ),
    );
  }
}
