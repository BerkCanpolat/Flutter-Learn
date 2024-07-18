// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'model/product_config_model.dart';

void main() {
  calculateMoney();

  final user1 = User('Berk', 'aa');

  final newProduct2 = Product(user1.product);

  Product.berk();

  ProductConfig.instance.apiKey;

}

void calculateMoney() {
  if (Product.money > 5) {
    print('5 tl daha ekledik');
    Product.incrementMoney(5);
    print(Product.money);
  }
}

class Product {
  static int money = 10;
  String name;

  Product(this.name);

  Product.berk([this.name = 'Berk']);

  static void incrementMoney(int newMoney) {
    money += newMoney;
  } 
}

class User {
  final String name;
  final String product;

  User(this.name,this.product,);

  
}