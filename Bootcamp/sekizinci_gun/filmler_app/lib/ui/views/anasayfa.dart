import 'package:filmler_app/data/entity/filmler.dart';
import 'package:filmler_app/ui/views/detay_sayfa.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  Future<List<Filmler>> filmleriYukle() async {
    var filmlerListesi = <Filmler>[];
    var f1 = Filmler(id: 1, adi: "Django", resim: "django.png", fiyat: 24);
    var f2 = Filmler(id: 2, adi: "Insterstellar", resim: "interstellar.png", fiyat: 32);
    var f3 = Filmler(id: 3, adi: "Inception", resim: "inception.png", fiyat: 16);
    var f4 = Filmler(id: 4, adi: "The Hateful Eight", resim: "thehatefuleight.png", fiyat: 28);
    var f5 = Filmler(id: 5, adi: "The Pianist", resim: "thepianist.png", fiyat: 18);
    var f6 = Filmler(id: 6, adi: "Anadoluda", resim: "anadoluda.png", fiyat: 10);
    filmlerListesi.add(f1);
    filmlerListesi.add(f2);
    filmlerListesi.add(f3);
    filmlerListesi.add(f4);
    filmlerListesi.add(f5);
    filmlerListesi.add(f6);
    return filmlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmler"),
      ),
      body: FutureBuilder<List<Filmler>>(
        future: filmleriYukle(), 
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            var filmListe = snapshot.data;
            return GridView.builder(
              itemCount: filmListe!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.8
                ), 
              itemBuilder: (context, index) {
                var film = filmListe[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film: film)));
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset("assets/${film.resim}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("${film.fiyat} ₺",style: TextStyle(fontSize: 20),),
                            ElevatedButton(onPressed: (){}, child: Text("Satın Al"))
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        }
        ),
    );
  }
}