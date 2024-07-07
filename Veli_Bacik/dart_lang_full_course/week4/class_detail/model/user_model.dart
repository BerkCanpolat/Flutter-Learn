//Bütün classlar bütün objeler başka bir elemandan türer. Bunada extends etmek denir.
class User extends Object{
  // Özellikleri neler
  // Late -> Bu değer sonradan dolacak, birisi bunu initizalized ettiğinde dolacak anlamı olacak
  late final String name;
  late int money;
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

  bool isSpecialUser(String id) {
    return _id == id;
  }

/*   bool isEmptyId() {
    return _id.isEmpty;
  } */

  //Error function
  //Geriye değer döndürecek şekilde yapılır
  //get kullanırsak bu değer çağırıldığında hesaplanır.
  bool get isEmptyId => _id.isEmpty;
}