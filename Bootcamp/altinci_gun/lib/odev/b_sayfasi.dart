import 'package:altinci_gun/odev/odev_veri.dart';
import 'package:altinci_gun/odev/y_sayfasi.dart';
import 'package:flutter/material.dart';

class BSayfasi extends StatefulWidget {
  OdevVeri odev;
  BSayfasi({required this.odev});

  @override
  State<BSayfasi> createState() => _BSayfasiState();
}

class _BSayfasiState extends State<BSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("B SAYFASI"),
      ),
      body: Column(
        children: [
          Text("Alınan Veri: ${widget.odev.ad} - ${widget.odev.yas}"),
          ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => YSayfasi()));
        },
        child: Text(
          "Y Sayfasına git",
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
      ),
        ],
      )
    );
  }
}
