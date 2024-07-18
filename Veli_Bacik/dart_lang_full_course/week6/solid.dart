// ignore_for_file: public_member_api_docs, sort_constructors_first
void main() {
  IDatabase database = SQL();

  database = Mongo();
  database.write();
}

class UserManager {
  String name;
  UserManager({
    required this.name,
  });
  void changeUserName(String name) {
    this.name = name;
  }
}

class UserLocalization {
  final UserManager manager;
  UserLocalization({
    required this.manager,
  });

  void updateNameAndLocalization() {
    manager.changeUserName('a');
    changeLocalization();
  }

  void changeLocalization() {
    print('Object');
  }
}

//Open closed principle(OSP)

class Productt {
  final String name;
  final String money;
  Productt({
    required this.name,
    required this.money,
  });
}


class ProductCategoriess extends Productt {
  ProductCategoriess({required super.name, required super.money});

  final String category = "l";

}


//Liskov substitution Principle(LSP)
abstract class IDatabase {
  void write();
}

class SQL extends IDatabase {
  @override
  void write() {
    // TODO: implement write
  }

}

class Mongo extends IDatabase {
  @override
  void write() {
    // TODO: implement write
  }

}

//Interface Segregation Principle(ISP)

