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

  b1.money += 10;
  print(b1.money);

  b1..money += 10..updateName('BERK');

print(b1);
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

// With => Birlikte kullanma anlamına gelir. Dahil etme
class BankaSinifi with BankMixin {
  int money;
  final String id;
  String? name;

  BankaSinifi(this.money, this.id);

  void updateName(String name) {
    this.name = name;
  }

  int operator +(BankaSinifi newBank) {
    return this.money + newBank.money;
  }

  @override
  String toString() {
    // TODO: implement toString
    return super.toString() + 'berk';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BankaSinifi && other.id == id;
  }

  @override
  int get hashCode => money.hashCode ^ id.hashCode;
  
  @override
  void sayBankHello() {
    // TODO: implement sayBankHello
    calculateMoney(money);
  }
}


//Mixinler methodlar ve işlemi yapıp geri döndürürler.(Constructsız classlar olarak düşünebiliriz)

mixin BankMixin {
  void sayBankHello();
  void calculateMoney(int money) {
    print('Money');
  }
}