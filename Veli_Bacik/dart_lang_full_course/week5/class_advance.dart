void main() {
  final user = _User('berk', age: 9);

  //Kullanıcının yaşı değeri bir sayı mı kontrol eder.
  if (user.age is int) {
    if (user.age! < 18) {
      print('Evet kucuk');
      user.updateMoneyWithString('TR');
    } else {
      user.updateMoneyWithNumber(15);
    }
  }

  final _newType = user.moneyType is String ? user.moneyType : ""; (user.moneyType as String);
  print(_newType + 'A');

  final b1 = BankaSinifi(40,'12');
  final b2 = BankaSinifi(30,'12');

  print(b1 == b2);

  print(b1 + b2);

  print(b1 == b2);
  print(b1.toString());
}

// Classlarımızı eğer bu şekide tanımlarsak private olmuş oluyor.
class _User {
  final String name;
  int? age;

  dynamic moneyType;

  _User(this.name, {this.age});

  void updateMoneyWithString(String data) {
    moneyType = data;
  }

  void updateMoneyWithNumber(int number) {
    moneyType = number;
  }
}

class BankaSinifi {
  final int money;
  final String id;

  BankaSinifi(this.money, this.id);

  int operator +(BankaSinifi newBank) {
    return this.money + newBank.money;
  }

  @override
  String toString() {
    // TODO: implement toString
    return super.toString() + 'berk';
  }

  bool operator == (Object object) {
    return object is BankaSinifi && object.id == id;
  }
}