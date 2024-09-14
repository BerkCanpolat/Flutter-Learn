part of 'fav_bloc.dart';

abstract class FavEvent extends Equatable {
  const FavEvent();

  @override
  List<Object> get props => [];
}

class FetchFavoritItems extends FavEvent{}

class AddFavoritItems extends FavEvent{
  FavouriteItemModel favAdd;
  AddFavoritItems({required this.favAdd});
}

class SelectedItems extends FavEvent{
  FavouriteItemModel selectItems;
  SelectedItems({required this.selectItems});
}

class UnselectedItems extends FavEvent{
    FavouriteItemModel unSelectItems;
  UnselectedItems({required this.unSelectItems});
}

class DeletedItems extends FavEvent{}
