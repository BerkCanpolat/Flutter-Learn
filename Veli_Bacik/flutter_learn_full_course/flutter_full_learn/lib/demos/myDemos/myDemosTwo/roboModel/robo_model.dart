// ignore_for_file: public_member_api_docs, sort_constructors_first
class RoboModel {
  final String image;
  final String name;
  final double price;
  RoboModel({
    required this.image,
    required this.name,
    required this.price,
  });
}


class RoboModelItem {
  late final List<RoboModel> item;

  RoboModelItem() {
    item = [
      RoboModel(image: 'assets/t1.png', name: 'Erkek Tişört', price: 234.99),
      RoboModel(image: 'assets/t2.webp', name: 'Erkek Farklı Tişört', price: 344.99),
      RoboModel(image: 'assets/t1.png', name: 'Erkek Tişört', price: 234.99),
      RoboModel(image: 'assets/t2.webp', name: 'Erkek Farklı Tişört', price: 344.99),
    ];
  }
}