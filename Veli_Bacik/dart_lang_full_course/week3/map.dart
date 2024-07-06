void main() {
  // Müşteri geldi adı ahmet parası 20

  Map<String,dynamic> users = {'berk':20,'mehmet':30};

  print("Berkin parası ${users['berk']}");

  // Müşteri kimler var senin elinde

  for(var item in users.keys) {
    print('${item} - ${users[item]}');
  }

  for (var i = 0; i < users.length; i++) {
    print("${users.keys.elementAt(i)} - ${users.values.elementAt(i)}");
  }

  // Benim bankada müşterilerimin birden fazla hesabı olabilir.
  // Ahmet bey 3 hesabı var sırasıyla 100, 300, 200
  // Mehmet bey 2 hesabı var 30 50
  // Veli bey 1 hesap 30

  // Adamların hesaplarını kontrol et herhangi bir hesapta 150TL'den fazla olan varsa krediniz hazır de

  final Map<String,List<int>> bcBANK = {
    'ahmet':[100,300,200]
  };
  bcBANK['mehmet'] = [30,50];
  bcBANK['veli'] = [30];

  for (var item in bcBANK.keys) {

    // bankanın tüm elemanlarını dolaşıyoruz

    for(var money in bcBANK[item]!) {
      // userin hesaplarını doaşıyoruz
      if (money > 150) {
        print('kredin hazır');
        break;
      }
    }
  }

  // bankadaki müşterilerin hesaplarının toplam mevlasını merak ediyorum

  for (var item in bcBANK.keys) {
    // bcBank[item]! -> müşterinin hesapları demek
    int result = 0;
    for (var money in bcBANK[item]!) {
      result = result + money;
    }
    print('$item senin toplam paran -> $result');
  }
}