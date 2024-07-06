void main() {
  // Benim bir müşterim var parası  var mı yok mu kontrol eder misin
  final int userMoney = 0;

  controlUserMoney(userMoney, 0);
//option + shift + a(bunu yaparak toplu yorum satırına alabilirsin)
/*   if (userMoney > 0) {
    print("Parası var");
  } else {
    print("Parası yok");
  } */

  // Benim bi müşterim daha g eldi onada bakar mısın
  final int user2Money = 5;

  controlUserMoney(user2Money, 4);

/*   if (user2Money > 0) {
    print("Parası var");
  } else {
    print("Parası yok");
  } */

 final newUserMoney = 50;

 print(newUserMoney / 13);

 double result = convertToDolar(newUserMoney);

 if (result > 0) {}

 final newResult = convertToStandartDolar(100, dolarIndex: 13);
 final newResult2 = convertToStandartDolar(100);
 final newResult3 = convertToEuro(userMoney: 500);
 var string = sayHello("BERK");
 print(string);
}

void controlUserMoney(int money, int minimumValue) {

  if (money > minimumValue) {
    print("Para var");
  } else {
    print("Para yok");
  }
}

double convertToDolar(int userMoney) {
  return userMoney / 13;
}

double convertToStandartDolar(int userMoney , {int dolarIndex = 14}) {
  return userMoney / dolarIndex;
}

double convertToEuro({required int userMoney, int dolarIndex = 14}) {
  return userMoney / dolarIndex;
}

String sayHello(String name) {
  return 'hello $name';
}