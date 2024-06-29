// final sabittir sabitlere daha sonradan farklı bir değer atayamayız.
// Hafızada yeri ve boyutu belli olduğu için performans açısından daha faydalı.

void main() {
  int sayi = 30;
  print(sayi);
  sayi = 100;
  print(sayi);

  //Uygulama çalıştığı an hafızada oluşur.
  final int numara = 100;
  print(numara);
  //numara = 200;

  //Değişkeni tanımladığımızda hafızada oluşur.
  //Daha çok görsel nesnelerde kullanılır. Button, Text vb..
  const int sonuc = 500;
  print(sonuc);
  //sonuc = 400;
}