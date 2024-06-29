class Araba {
  String renk;
  int hiz;
  bool calisiyorMu;

  //Required kullanarak Class'ımızdan oluşturduğumuz nesnelerimizin özelliklerini bize belirtir.
  //Constructor, init metodu
  Araba({required this.renk, required this.hiz, required this.calisiyorMu});

  //Eğer bir fonksiyon Class'ın değişkenlerine farklı değer atıp değiştiriyorsa buna 'Side Effect' : Yan Etki Denir.
  void calistir() {
    calisiyorMu = true;
    hiz = 5;
  }

  void durdur() {
    calisiyorMu = false;
    hiz = 0;
  }

  void hizlanDir(int kacKm) {
    hiz = hiz + kacKm;
  }

  void bilgiAl() {
  print("------------------");
  print("Renk : ${renk}");
  print("Hız : ${hiz}");
  print("Çalışıyor Mu? : ${calisiyorMu}");
  }
}