class User2 {
  // Özellikleri neler
  // Late -> Bu değer sonradan dolacak, birisi bunu initizalized ettiğinde dolacak anlamı olacak
  // encapsulation -> Bu değişkenin dışardan gelen durumlar karşısında etkilenmemesi veya değişmemesi için getter ve setter'larını yazarız.
  // 'get' çağırıldığında. 'set' ise değer verildiğinde çalışır.
  final String name;
  int _money;

  int get money => _money;

  set money(int? money) {
/*     if(money == null) {
      _money = 0;
    } else {
      _money = money;
    } */

    _money = money == null ? 0 : money;
  }
  final int? age;
  final String? city;

  late final String userCode;

  User2(this.name, this._money, {this.age, this.city}) {
    userCode = (city ?? 'ist') + name;
  }


}

extension User2ControlExtension on User2 {
  void controlName() {
    print(name);
  }
}