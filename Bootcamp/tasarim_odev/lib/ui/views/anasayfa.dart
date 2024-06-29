import 'package:flutter/material.dart';
import 'package:tasarim_odev/data/entity/product.dart';
import 'package:tasarim_odev/ui/views/detay_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  Future<List<Product>> urunGetir() async {
    var urunListe = <Product>[];
    var u1 = Product(kategori_isim: "Kulaklık", kategori_icon: "kulaklik_icon.png", urun_isim: "JBL JR5", urun_fiyat: 200, urun_resim: "urun1.webp");
    var u2 = Product(kategori_isim: "Mouse", kategori_icon: "fare_icon.png", urun_isim: "Samsung Mouse", urun_fiyat: 499, urun_resim: "urun2.webp");
    var u3 = Product(kategori_isim: "Klavye", kategori_icon: "klavye_icon.svg.png", urun_isim: "Piranha Klavye", urun_fiyat: 399, urun_resim: "");
    var u4 = Product(kategori_isim: "USB", kategori_icon: "usb_icon.png", urun_isim: "Samsung USB Bellek", urun_fiyat: 399, urun_resim: "");
    var u5 = Product(kategori_isim: "Modem", kategori_icon: "modem_icon.png", urun_isim: "Xiaomi Modem", urun_fiyat: 355, urun_resim: "");
    var u6 = Product(kategori_isim: "Projektor", kategori_icon: "projektor_icon.png", urun_isim: "Projektor", urun_fiyat: 288, urun_resim: "");
    urunListe.add(u1);
    urunListe.add(u2);
    urunListe.add(u3);
    urunListe.add(u4);
    urunListe.add(u5);
    urunListe.add(u6);
    return urunListe;
  }

  bool aramaYapiliyormu = false;
  Future<void> ara(String aramaKelimesi) async {
    print("Aranan Kelime: $aramaKelimesi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyormu ? 
        TextField(
          decoration: InputDecoration(
            hintText: "Ara"
          ),
          onChanged: (value) {
            ara(value);
          },
        ) : 
        Text("Ürünler"),
        actions: [
          aramaYapiliyormu ?
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyormu = false;
            });
          }, icon: Icon(Icons.clear)) :
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyormu = true;
            });
          }, icon: Icon(Icons.search))
        ],
        ),
      body: FutureBuilder<List<Product>>(
        future: urunGetir(), 
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            var urunlerListesi = snapshot.data;
            return GridView.builder(
              itemCount: urunlerListesi!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                ), 
              itemBuilder: (context, index) {
                var urun = urunlerListesi[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(urun: urun)));
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/${urun.kategori_icon}", width: 100, height: 100,),
                          Text(urun.kategori_isim, style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                );
              }
            );
          } else {
            return const Center();
          }
        }
        ),
    );
  }
}