import 'package:altinci_gun/odev/a_sayfasi.dart';
import 'package:altinci_gun/odev/x_sayfasi.dart';
import 'package:flutter/material.dart';

class OdevAnasayfa extends StatefulWidget {
  const OdevAnasayfa({super.key});

  @override
  State<OdevAnasayfa> createState() => _OdevAnasayfaState();
}

class _OdevAnasayfaState extends State<OdevAnasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ödev Anasayfa"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ASayfasi()));
              }, 
              child: Text("A Sayfasına git",style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => XSayfasi()));
              }, 
              child: Text("X Sayfasına git",style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              ),
          ],
        ),
      ),
    );
  }
}