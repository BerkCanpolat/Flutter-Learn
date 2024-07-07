import 'class_detail/model/user_model.dart';
import 'class_detail/model/user_model_2.dart';

void main() {
  // Müşteri adı var, parası var, yaşı var

  int customerMoney = 15;
  User user1 = User("bc", 14, age: 21, city: "Ankara", id: '2');
  User user2 = User("bc", 14, id: '3');

  final user3 = User("aa", 130, age: 25, city: "istanbul", id: '12');

  user1.name;
  print(user1.name);

  if (user3.city == null) {
    print("Müşteri şehir bilgisini vermemiş");
  } else {
    if (user3.city == 'istanbul') {
      print("Tebrikler kazandınız");
    }
  }

  // Müşteri idsi 12 olana indirim yap
  if (user3.isSpecialUser('12')) {
    user3.money += 5;
    print("İndirim yapıldı");
    user3.isEmptyId;
  }

  //
  User2 newUser2 = User2("bb", 15);
  newUser2.money += 5;
  newUser2.money = 5;

  // Bütün methodların size string dönmesini sağlıyorum anlamına gelir.
  // Instance of 'User2' -> User2 class'ından bir değer oluşturulmuş anlamına gelir.
  print(newUser2.toString());
}

/* class User {
  // Özellikleri neler
  // Late -> Bu değer sonradan dolacak, birisi bunu initizalized ettiğinde dolacak anlamı olacak
  late final String name;
  late final int money;
  late final int? age;
  late final String? city;

  late final String userCode;

  late final String _id;

  User(String name, int money, {required String id,int? age, String? city}) {
    this.name = name;
    this.money = money;
    this.age = age;
    this.city = city;
    _id = id;
    // Bu değer gelmezse default değer olarak istanbulu kabul et demek
    userCode = (city ?? 'ist') + name;
  }
} */

// İKİNCİ YÖNTEM
/* class User2 {
  // Özellikleri neler
  // Late -> Bu değer sonradan dolacak, birisi bunu initizalized ettiğinde dolacak anlamı olacak
  final String name;
  final int money;
  final int? age;
  final String? city;

  late final String userCode;

  User2(this.name, this.money, {this.age, this.city}) {
    userCode = (city ?? 'ist') + name;
  }
} */
