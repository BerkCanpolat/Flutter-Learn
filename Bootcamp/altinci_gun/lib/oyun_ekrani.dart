import 'package:altinci_gun/kisiler.dart';
import 'package:altinci_gun/sonuc_ekrani.dart';
import 'package:flutter/material.dart';

class OyunEkrani extends StatefulWidget {
  /*String ad;
  int yas;
  double boy;
  bool bekar;
  */
  Kisiler kisi;
  OyunEkrani({required this.kisi});

  @override
  State<OyunEkrani> createState() => _OyunEkraniState();
}

class _OyunEkraniState extends State<OyunEkrani> {
  Future<bool> geriDonusTusu(BuildContext) async{
    print("Navigation geri tuşu seçildi");
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Oyun Ekranı"),
        leading: IconButton(onPressed: (){
          print("Appbar geri tuşu seçildi");
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: WillPopScope(
        onWillPop: () => geriDonusTusu(BuildContext),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${widget.kisi.ad} - ${widget.kisi.yas} - ${widget.kisi.boy} - ${widget.kisi.bekar}"),
              ElevatedButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SonucEkrani()));
              }, child: Text("Bitti"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}