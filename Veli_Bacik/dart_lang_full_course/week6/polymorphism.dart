// ignore_for_file: public_member_api_docs, sort_constructors_first
void main() {

  IUserr user = Turk();

  user.sayName();

  user = English();

  user.sayName();
}

abstract class IUserr {
  final String name;
  IUserr(this.name);
  void sayName();
}

class Turk implements IUserr{
  @override
  // TODO: implement name
  String get name => 'Berk';

  @override
  void sayName() {
    // TODO: implement sayName
    print("Hello $name");
  }
}

class English implements IUserr{
  @override
  // TODO: implement name
  String get name => 'Adam';

  @override
  void sayName() {
    // TODO: implement sayName
    print("Welcome to your home $name");
  }
}