void main() {
  //Primitiv tag(String,bool,int,double)
  int money = 15;

  if(money > 10) {
    print("Sen zenginsin abii");
  } else {
    print("gerekirse simit yeriz");
  }

  money = money - 10;

  if(money > 10) {
    print("Sen çok zenginsin abi");
  } else {
    print("Abi burda ne işin var");
  }

  //

  //Müşteri bankaya gelir, 10 tl si vardır ve bir sorgu yapar
  //Sorgu sonucu 20'tl si alınır. Fakat eğer parası sorguya yeterliyse
  //Eğer kalan parası sıfırdan küçükse bankadan kovulur
  //Eğer adamın parası bankingCost'a yetmiyorsa bankaya almayın.
  int newCustomerMoney = 0;
  const int bankingCost = 5;
  const int bankingCostGeneral = 20;

  if(newCustomerMoney > bankingCost) {
    print("Hoşgeldiniz beyefendi");
    newCustomerMoney = newCustomerMoney - bankingCostGeneral;
  } else if(newCustomerMoney > 0) {
    print("Beyefendi lütfen sıra alınız");
  } else {
    print("Beyefendi Kredinizi ödeyin");
  }

  //Bir mağazaya isim verilecek
  //Örnek isimler toplanır
  //Örnek isimler: ahmet, veli, kx
  //Mağaza derki ben sadece karakter uzunluğu 2 veya daha altı olanları görmek istiyorum

  final String isim1 = "Ahmet";
  final String isim2 = "Veli";
  final String isim3 = "Kx";
  final String isim4 = "K";

  const int companyLenght = 2;
  String result = "";

  if (isim1.length > companyLenght) {
    result = result + isim1;
  }
  if (isim2.length > companyLenght) {
    result = result + isim2;
  }
  if (isim3.length > companyLenght) {
    result = result + isim3;
  }
  if (isim4.length > companyLenght) {
    result += isim4;
  }

  if(result.length == 0) {
    print("Patron bulamadık");
  } else {
    print(result);
  }
}