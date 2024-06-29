class Fonksiyonlar {
  //Void(Geri dönüş değeri olmayan)

  void selamla1() {
    String sonuc = "Merhaba Berk";
    print(sonuc);
  }

  //Return: Geri dönüş Değeri Olan
  String selamla2() {
    String sonuc = "Merhaba Berk2";
    return sonuc;
  }

  //Parametre: Dışardan veri almak
  void selamla3(String isim) {
    String sonuc = "Merhaba $isim";
    print(sonuc);
  }

  //Return - Parametre kullanımı
  String selamla4(String isim) {
    String sonuc = "Merhaba $isim";
    return sonuc;
  }

  //Dart dilinde 'Overloading' kavramı yoktur.
  //Sınıf içerisinde bir methodun adını tekrar kullanmak.
}