import 'dart:collection';

void main() {
  //Tanımlama
  var sayilar = {"Bir":1,"İki":2,"Üç":3};
  var iller = HashMap<int, String>();

  //Değer Atama
  iller[16] = "Bursa";
  iller[34] = "İstanbul";
  print(iller);

  //Güncelleme
  iller[16] = "Yeni Bursa";
  print(iller);

  String il = iller[34]!;
  print(il);

  var anahtarlar = iller.keys;

      for(var a in anahtarlar) {
    print("No: $a - ${iller[a]}");
  }
}