void main() {
  //1.Compile error
  String x = "Hello";
  //x = 100

  //2 Runtime exception (error)
  var liste = <String>[];

  liste.add("Ahmet");
  liste.add("Berk");



  try {
  String isim = liste[3];
  print("Gelen isim: $isim");
  } catch(e) {
    print("Listenin boyutunu aştınız");
  }
}