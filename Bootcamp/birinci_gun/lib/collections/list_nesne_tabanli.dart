import 'package:birinci_gun/collections/ogrenciler.dart';

void main() {
  var o1 = Ogrenciler(no: 200, ad: "Zeynep", sinif: "9C");
  var o2 = Ogrenciler(no: 300, ad: "Ahmet", sinif: "11Z");
  var o3 = Ogrenciler(no: 600, ad: "Beyza", sinif: "12A");

  var ogrencilerListesi = <Ogrenciler>[];
  ogrencilerListesi.add(o1);
  ogrencilerListesi.add(o2);
  ogrencilerListesi.add(o3);

  for(var ogrenci in ogrencilerListesi) {
    print("No: ${ogrenci.no} - Ad: ${ogrenci.ad} - Sınıf: ${ogrenci.sinif}");
  }

  //Sorting
  print("------- Sayısal Küçükten Büyüğe");
  Comparator<Ogrenciler> s1 = (x,y) => x.no.compareTo(y.no);
  ogrencilerListesi.sort(s1);

  for(var ogrenci in ogrencilerListesi) {
    print("No: ${ogrenci.no} - Ad: ${ogrenci.ad} - Sınıf: ${ogrenci.sinif}");
  }

    print("------- Sayısal Büyükten Küçüğe");
  Comparator<Ogrenciler> s2 = (x,y) => y.no.compareTo(x.no);
  ogrencilerListesi.sort(s2);

  for(var ogrenci in ogrencilerListesi) {
    print("No: ${ogrenci.no} - Ad: ${ogrenci.ad} - Sınıf: ${ogrenci.sinif}");
  }


  //Filtreleme
  Iterable<Ogrenciler> f1 = ogrencilerListesi.where((ogrencilerListesi) {
    return ogrencilerListesi.no > 200;
  });

  var liste1 = f1.toList();

    for(var ogrenci in liste1) {
    print("No: ${ogrenci.no} - Ad: ${ogrenci.ad} - Sınıf: ${ogrenci.sinif}");
  }
}