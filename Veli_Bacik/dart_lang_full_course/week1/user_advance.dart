void main() {
  // Kodu sabitlemek sonradan değiştirilmesini istemiyorsak FİNAL-CONST yapısını kullanırız.
  // FİNAL uygulama çalıştığındaki değeri alır.
  // Proje başlarken kod derlendirğinde o neyse o gözükür.
  final String userName = "Berk";

  final int bankMoney = 100;
  const String bankName = "BC Bank";

  var userName2 = "Berk2";
  var userName2Money = 15;


  // --------
  // Bank name = "BC BANK"
  // bank user 1 = "bank1musteri"
  // bank user 1 in parası 100.00
  // bank1 musteriye kimse dokunamaz
  // yeni bir musteri gelecek adı bank2musteri
  // yeni bankaya gelenden bu bank user1 parasını cıkartıp ekrana gösterelim

  // camel case
  const String bankNameSpecial = "BC Bank";

  const String user1 = "Bank 1 müşteri";
  const double user1Money = 100.00;

  const String user2 = "Bank 2 müşteri";
  int user2Money = 500;

  user2Money =  user2Money - user1Money.toInt();

  print("User 2 money: $user2Money");
}