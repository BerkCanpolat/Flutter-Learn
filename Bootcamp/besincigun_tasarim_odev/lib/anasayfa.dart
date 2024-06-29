import 'package:besincigun_tasarim_odev/renkler.dart';
import 'package:besincigun_tasarim_odev/textButton.dart';
import 'package:besincigun_tasarim_odev/urunler.dart';
import 'package:besincigun_tasarim_odev/urunler2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    var d = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          d!.appBar,
          style: TextStyle(color: appBarYazi, fontFamily: "Poppins"),
        ),
        backgroundColor: appBarRenk,
        centerTitle: true,
      ),
      body: Column(
        children: [
          UrunlerSayfa(),
          Urunler2(),
          ButtonText(icerik: d.buttonCik)
        ],
      ),
    );
  }
}
