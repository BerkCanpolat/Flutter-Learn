void main() {
  final userNormal = Users('bc', 15);
  final usersBank = BankUser('name', 155, 123);
  final userSpecial = SpecialUser('asdasd', 124123123, 1231231234, 30);
  userNormal.sayMoneyWithCompanyName();
  usersBank.sayMoneyWithCompanyName();
  userSpecial.sayMoneyWithCompanyName();

  print(userSpecial.calculateMoney);
  print(userSpecial.money);
}

// Paralarını görebilmelerini istiyorum benim banka ismimle birlikte

//Abstract class hangi class ile extends edersek özelliklerini o class'a aktarır.
abstract class IUser {
  final String name;
  final int money;
  IUser(this.name,this.money);
  void sayMoneyWithCompanyName() {
    print("Berk - $money paranız vardır");
  }
}

class Users extends IUser{
  final String name;
  final int money;

  Users(this.name,this.money):super(name,money);
  
}


class BankUser extends IUser{
  final int bankingCode;

  BankUser(String name, int money,this.bankingCode):super(name,money);
}


class SpecialUser extends IUser{
  final String name;
  final int money;
  final int bankingCode;
  late final int _discount;

  SpecialUser(this.name,this.money,this.bankingCode, int discount) : super(name, money) {
    _discount = discount;
  }

  int get calculateMoney => money - (money ~/ _discount);
}