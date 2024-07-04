void main() {
  // Müşterinin adını tut
  // Müşterinin parasını öğren
  // Müşteriye merhaba diyip parasını söyle
  // Bizim bankaya geldiğii için parasına +5 tl ekle

  int userMoney = 25;
  String userName = "Berk";
  userMoney = userMoney + 5;

  print("Merhaba $userName $userMoney");

  print('---------');
  userMoney = userMoney - 10;

  print("Paranız değer kaybetti $userMoney");

  userMoney += 5;

  double berkMoney = 15.2;

  berkMoney = berkMoney/2;
  print("Berk bey paranız uçtu $berkMoney");
}

// --ÖDEV--
// Yeni bir user adı oluştur
// yeni bir para ver
// bu parayı 20 ye böl ve ekranda göster