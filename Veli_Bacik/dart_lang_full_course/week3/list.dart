void main() {
  //LİSTELER BİR REFERANS TİPİDİR.
  // Bir bankaya on müşteri gelir bunların 100 tl'si 110tl 50tl'si vardır
  final int money1 = 100;
  final int money2 = 110;

  // 100'den büyük olanlara hoşgeldiniz beyfendi
  if(money1 > 100) {
    print("Beyefendi");
  }

  if(money2 > 100) {
    print("aa");
  }


  String name = '';

  List<int> moneys = [100,110,500, 200];
  final List<int> newMoneys = [100,110,500, 200];

  print("Müştei 1 parası: ${moneys[0]}");

  // müşterileri parası büyük olana göre almak istiyorum

  //Sort elemanları sıralar.
  moneys.sort();
  //Add methodu sıralamanın en sonuna ekleme yapar.
  moneys.add(5);
  //insert edersek eğer 2.Sıraya 300 yaz demiş oluruz.
  moneys.insert(2, 300);
  print(moneys);

  newMoneys.add(4);
  //Ana listeyi etkilemeden elimizde yeni bir liste oluşmuş oluyor.
  newMoneys.reversed.toList();
  print(newMoneys);

  // 100 tane müşteri yap bunların hepsine sıra ile numarasına göre 5 tl ekle

  List<double> customerMoney = List.generate(100, (index) {
    return index + 5;
  });
  print(customerMoney);

  // Customers 100 30 40 60
  // 35 tl den büyük olanlara burada kredi verebiliriz
  // Küçük olanlara bye yazdır

  List<int> moneyCustomerNews = [100,30,40,60];

  moneyCustomerNews.sort();

  for (int i = 0; i < moneyCustomerNews.length; i += 1) {
    print('müşteri parası ${moneyCustomerNews[i]}');
    if (moneyCustomerNews[i] > 35) {
      print("Kredi hazır");
    } else if (moneyCustomerNews[i] > 0) {
      print("Kredi veremeyiz ama bi bakalım");
    } else {
      print("Bye");
    }
  }

  List<dynamic> user = [1,'a', true];

  for (var item in user) {
    print(item);
  }

  List<String> userNames = ["Ali","Mehmet","Ayşe"];

  userNames.contains('Berk');

  for (var item in userNames) {
    if (item == 'Berk') {
      print("Var");
    } else {
      print("Yok");
    }
  }
}