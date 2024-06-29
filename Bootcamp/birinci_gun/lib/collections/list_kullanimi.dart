void main() {
  //Tanımlama
  var plakalar = [16,23,6];
  var meyveler = <String>[];

  //Veri ekleme
  meyveler.add("muz");
  meyveler.add("kiraz");
  meyveler.add("elma");

  print(meyveler);

  //Güncelleme
  meyveler[1] = "Yeni Kİraz";
  print(meyveler);

  //Insert
  meyveler.insert(1, "Portakal");
  print(meyveler);

  //Veri okuma
  String meyve = meyveler[2];
  print(meyve);

  print("Boyut ${meyveler.length}");
  print("Boş Kontrol ${meyveler.isEmpty}");

  //For Each
  for(meyve in meyveler) {
    print("Sonuç: $meyve");
  }

  for(var i=0; i<meyveler.length;i++) {
    print("$i ----> ${meyveler[i]}");
  }

  var liste = meyveler.reversed.toList();
  print(liste);

  meyveler.sort();
  print(meyveler);

  meyveler.removeAt(1);
  print(meyveler);

  meyveler.clear();
  print(meyveler);
}