part of 'fav_bloc.dart';

enum ListStatus{loading,success,failed}

class FavState extends Equatable {
  final List<FavouriteItemModel> favoritList;
  final List<FavouriteItemModel> temFavoritList;
  final ListStatus listStatus;
  const FavState({this.favoritList = const [], this.temFavoritList = const [], this.listStatus = ListStatus.loading});

  FavState copyWith({
    List<FavouriteItemModel>? favoritList,
    List<FavouriteItemModel>? temFavoritList,
    ListStatus? listStatus
  }) {
    return FavState(
      favoritList: favoritList ?? this.favoritList,
      temFavoritList: temFavoritList ?? this.favoritList,
      listStatus: listStatus ?? this.listStatus
    );
  }
  
  @override
  List<Object> get props => [favoritList, temFavoritList, listStatus];
}