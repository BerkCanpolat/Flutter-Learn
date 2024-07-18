// ignore_for_file: public_member_api_docs, sort_constructors_first
void main() {
  final model = CarModel(category: CarModels.bmw, name: 'bmw x5', money: 123123, isSecondHand: false);

  final carItems = [
    CarModel(category: CarModels.bmw, name: 'bmw x5', money: 123123, isSecondHand: false),
    CarModel(category: CarModels.toyota, name: 'Toyota', money: 123123, isSecondHand: false),
    CarModel(category: CarModels.yamaha, name: 'Yamaha', money: 123123),
  ];

  //Var mı => any, kaç tane => where
  final resultCount = carItems.where((element) => element.isSecondHand == true).length;
  print(resultCount);

  final newCar = CarModel(category: CarModels.bmw, name: 'bmw x5', money: 123123);
  final isHaveCar = carItems.contains(newCar);
  if (isHaveCar) {
    print("Elimizde var");
  } else {
    print("Patron yok alalım");
  }

  //join => toString methodunu basar.
  final resultBmwMore20 = carItems.where((element) {
    return element.category == CarModels.bmw && element.money > 20;
  }).join();
  print(resultBmwMore20);

  // Map => Bundan yeni bir obje üretmek anlamına gelir.
  final carNames = carItems.map((e) => e.name).join(',');
  print(carNames);

  bool isHaveCarMercedes = false;

  try {
    final mercedesCar = carItems.singleWhere((elemeny) => elemeny.category == CarModels.mercedes);
    print(mercedesCar);
    isHaveCarMercedes = true;
  } catch (e) {
    print("Araba yok");
    isHaveCarMercedes = false;
  } finally {
    print('abi bu işlem ağır oldu bidaha sorma $isHaveCarMercedes');
  }

  final index = carItems.indexOf(newCar);
  print(index);

  carItems.add(CarModel(category: CarModels.mercedes, name: 'mercedes', money: 123123));
  carItems.sort((first, second) => first.money.compareTo(second.money));

  calculateToUser(carItems);
  carItems.removeWhere((element) => element.category == CarModels.bmw || element.money < 30);
  print(carItems);



  
}

void calculateToUser(List<CarModel> items) {
  final newItems = items.map((CarModel e)  {
    if (e.category == CarModels.bmw) {
      e.category = CarModels.yamaha;
    }

    if(e.isSecondHand) {
      e.isSecondHand = false;
    }

    return e;

  });
  print(newItems);
}

class CarModel {
  CarModels category;
  final String name;
  final double money;
  String? city;

  bool isSecondHand;

  CarModel({
    required this.category,
    required this.name,
    required this.money,
    this.city,
    this.isSecondHand = true,
  });

  


  @override
  bool operator ==(covariant CarModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.category == category &&
      other.name == name &&
      other.money == money &&
      other.city == city &&
      other.isSecondHand == isSecondHand;
  }

  @override
  int get hashCode {
    return category.hashCode ^
      name.hashCode ^
      money.hashCode ^
      city.hashCode ^
      isSecondHand.hashCode;
  }
}

enum CarModels {bmw, yamaha, toyota, mercedes}