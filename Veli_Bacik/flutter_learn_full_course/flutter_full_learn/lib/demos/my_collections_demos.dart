// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyCollectionsDemos extends StatefulWidget {
  const MyCollectionsDemos({super.key});

  @override
  State<MyCollectionsDemos> createState() => _MyCollectionsDemosState();
}

class _MyCollectionsDemosState extends State<MyCollectionsDemos> {
  late final List<CollectionModel> _items;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _items = CollectionItems().items;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        padding: CardPaddingUtility().paddingSymetric,
        itemCount: _items.length,
        itemBuilder: (context, index) {
          var cardItem = _items[index];
          return _CategoryCard(model: cardItem,);
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    super.key,
    required CollectionModel model,
  }) : _model = model;

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: CardPaddingUtility().paddingBottom,
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: CardPaddingUtility().paddingGeneral,
          child: Column(
            children: [
              Expanded(child: Image.asset(_model.imagePath, fit: BoxFit.fill,)),
              Padding(
                padding: CardPaddingUtility().paddingTop,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _model.title,
                      style: TextStyle(color: Colors.black),
                      ),
                    Text(
                      "${_model.price} eth",
                      style: TextStyle(color: Colors.black),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;

  CollectionModel({
    required this.imagePath,
    required this.title,
    required this.price,
  });


}





class CardPaddingUtility {
  final paddingTop = EdgeInsets.only(top: 10);
  final paddingBottom = EdgeInsets.only(bottom: 40);
  final paddingGeneral = EdgeInsets.all(10.0);
  final paddingSymetric = EdgeInsets.symmetric(horizontal: 10);
}

class CollectionItems {
  late final List<CollectionModel> items;

  CollectionItems() {
     items = [
      CollectionModel(imagePath: ProjectImage.imageCollection, title: 'Abstract Art', price: 3.55),
      CollectionModel(imagePath: ProjectImage.imageCollection, title: 'Abstract Art2', price: 3.14),
      CollectionModel(imagePath: ProjectImage.imageCollection, title: 'Abstract Art3', price: 2.99),
      CollectionModel(imagePath: ProjectImage.imageCollection, title: 'Abstract Art4', price: 5.66),
    ];
  }
}

class ProjectImage {
  static const imageCollection = 'assets/foto1.jpg';
}