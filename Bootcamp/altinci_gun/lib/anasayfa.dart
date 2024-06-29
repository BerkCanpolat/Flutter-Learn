import 'package:altinci_gun/kisiler.dart';
import 'package:altinci_gun/oyun_ekrani.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int sayac = 0;
  bool kontrol = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("İnitState() çalıştı");
  }

  Future<int> toplama(int sayi1, int sayi2) async{
    int toplam = sayi1 + sayi2;
    return toplam;
  }

  @override
  Widget build(BuildContext context) {
    print("Build çalıştı");
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sonuç: $sayac"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  sayac += 1;
                });
              },
              child: Text("Tıkla"),
            ),
            ElevatedButton(
              onPressed: () {
                var kisi = Kisiler(ad: "Berk", yas: 25, boy: 178, bekar: true);
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OyunEkrani(kisi: kisi)))
                    .then((value) {
                  print("Anasayfaya dönüş yakalandı");
                });
              },
              child: Text("Başla"),
            ),
            Visibility(visible: kontrol , child: const Text("İlk Text")),
            Text(kontrol ? "İkinci Text" : "X",style: TextStyle(color: kontrol ? Colors.blue : Colors.red),),
            ((){
              if(kontrol) {
                return const Text("Üçüncü Text",style: TextStyle(color: Colors.blue),);
              } else {
                return const Text("Güle Güle",style: TextStyle(color: Colors.orange),);
              }
            }()),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  
                });
                kontrol = true;
                },
              child: Text("Durum 1(True)"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  
                });
                kontrol = false;
                },
              child: Text("Durum 1(False)"),
            ),
            FutureBuilder<int>(
              future: toplama(10, 20), 
              builder: (context, snapshot) {
                if(snapshot.hasError) {
                  return const Text("Hata Oluştu");
                }
                if(snapshot.hasData) {
                  return Text("Sonucç: ${snapshot.data}");
                } else {
                  return const Text("Sonuç yok");
                }
              }
              ),
          ],
        ),
      ),
    );
  }
}
