import 'package:bloc_zero_to_hero/models/favourite_model/fav_model.dart';

class FavRepository {
  Future<List<FavouriteItemModel>> fetchItems() async {
    await Future<void>.delayed(const Duration(seconds: 3));
    return List.of(_generatedItemsList(10));
  }

  List<FavouriteItemModel> _generatedItemsList(int lenght) {
    return List.generate(lenght, (e) => FavouriteItemModel(id: '$e', value: 'Item $e'));
  }
}