import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_zero_to_hero/models/favourite_model/fav_model.dart';
import 'package:bloc_zero_to_hero/repository/fav_repository.dart';
import 'package:equatable/equatable.dart';

part 'fav_event.dart';
part 'fav_state.dart';

class FavBloc extends Bloc<FavEvent, FavState> {
  List<FavouriteItemModel> favModel = [];
  List<FavouriteItemModel> temFavModel = [];


  final FavRepository favRepository;
  FavBloc(this.favRepository) : super(const FavState()) {
    on<FetchFavoritItems>(_fetchFavMethod,);
    on<AddFavoritItems>(_addFavouriteMethod,);
    on<SelectedItems>(_selectedItemMethod,);
    on<UnselectedItems>(_unSelectedItemsMethod,);
    on<DeletedItems>((event, emit) {
      for (var i = 0; i < temFavModel.length; i++) {
        favModel.remove(temFavModel[i]);
      }
      temFavModel.clear();
      emit(state.copyWith(favoritList: List.from(favModel), temFavoritList: List.from(temFavModel)));
    },);
  }

  FutureOr<void> _unSelectedItemsMethod(UnselectedItems event, Emitter<FavState> emit) {
    temFavModel.remove(event.unSelectItems);
  emit(state.copyWith(temFavoritList: List.from(temFavModel)));
  }

  FutureOr<void> _selectedItemMethod(SelectedItems event, Emitter<FavState> emit) {
    temFavModel.add(event.selectItems);
    emit(state.copyWith(temFavoritList: List.from(temFavModel)));
  }

  FutureOr<void> _addFavouriteMethod(AddFavoritItems event, Emitter<FavState> emit) async {
    final favList = await favModel.indexWhere((e) => e.id == event.favAdd.id);
    if(event.favAdd.isFavourite) {
      if(temFavModel.contains(favModel[favList])) {
        temFavModel.remove(favModel[favList]);
        temFavModel.add(event.favAdd);
      }
    } else {
      if(temFavModel.contains(favModel[favList])) {
        temFavModel.remove(favModel[favList]);
        temFavModel.add(event.favAdd);
      }
    }
    favModel[favList] = event.favAdd;
    emit(state.copyWith(favoritList: List.from(favModel), temFavoritList: List.from(temFavModel)));
  }

  FutureOr<void> _fetchFavMethod(FetchFavoritItems event, Emitter<FavState> emit) async {
    favModel = await favRepository.fetchItems();
    emit(state.copyWith(favoritList: List.from(favModel), listStatus: ListStatus.success));
  }
}
