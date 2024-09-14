import 'package:bloc_zero_to_hero/bloc/fav_bloc/fav_bloc.dart';
import 'package:bloc_zero_to_hero/models/favourite_model/fav_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavView extends StatefulWidget {
  const FavView({super.key});

  @override
  State<FavView> createState() => _FavViewState();
}

class _FavViewState extends State<FavView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavBloc>().add(FetchFavoritItems());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Bloc'),
        actions: [
          BlocBuilder<FavBloc, FavState>(
            builder: (context, state) {
              return Visibility(
                visible: state.temFavoritList.isNotEmpty ? true : false,
                child: IconButton(onPressed: (){
                  context.read<FavBloc>().add(DeletedItems());
                }, icon: Icon(Icons.delete, color: Colors.red,)));
            },
          )
        ],
      ),
      body: BlocBuilder<FavBloc, FavState>(
        builder: (context, state) {
          switch(state.listStatus){
            case ListStatus.loading:
              return Center(child: CircularProgressIndicator(),);
            case ListStatus.failed:
              return Text('ERROR');
            case ListStatus.success:
              return ListView.builder(
                itemCount: state.favoritList.length,
                itemBuilder: (context, index) {
                  final item = state.favoritList[index];
                  return Card(
                    child: ListTile(
                      title: Text(
                        item.value.toString(), style: TextStyle(
                          decoration: state.temFavoritList.contains(state.favoritList[index]) ? TextDecoration.lineThrough : TextDecoration.none,
                          color: state.temFavoritList.contains(state.favoritList[index]) ? Colors.red : Colors.black
                        ),
                        ),
                      trailing: IconButton(onPressed: (){
                        FavouriteItemModel fav = item;
                        context.read<FavBloc>().add(AddFavoritItems(favAdd: FavouriteItemModel(id: fav.id, value: fav.value, isFavourite: fav.isFavourite ? false : true)));
                      }, icon: Icon(item.isFavourite ? Icons.favorite : Icons.favorite_border)),
                      leading: Checkbox(
                        value: state.temFavoritList.contains(state.favoritList[index]), 
                      onChanged: (bool? value) {
                        FavouriteItemModel fav = item;
                        if(value!) {
                          context.read<FavBloc>().add(SelectedItems(selectItems: fav));
                        } else {
                          context.read<FavBloc>().add(UnselectedItems(unSelectItems: fav));
                        }
                      },
                      ),
                    ),
                  );
                },
            );
          }
        },
      ),
    );
  }
}