import 'package:altinci_gun/odev/b_sayfasi.dart';
import 'package:altinci_gun/odev/odev_veri.dart';
import 'package:flutter/material.dart';

class ASayfasi extends StatefulWidget {
  const ASayfasi({super.key});

  @override
  State<ASayfasi> createState() => _ASayfasiState();
}

class _ASayfasiState extends State<ASayfasi> {
  var nesne = OdevVeri(ad: "Berk", yas: 25);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("A SAYFASI"),),
      body: Center(child: ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => BSayfasi(odev: nesne)));
      }, child: Text("B SAYFASINA GİT"))),
    );
  }
}