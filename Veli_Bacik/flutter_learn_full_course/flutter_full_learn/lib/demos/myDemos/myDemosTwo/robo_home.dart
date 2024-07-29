import 'package:flutter/material.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboCore/robo_title.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboModel/robo_model.dart';

class RoboHome extends StatefulWidget {
  const RoboHome({super.key});

  @override
  State<RoboHome> createState() => _RoboHomeState();
}

class _RoboHomeState extends State<RoboHome> {
  late final List<RoboModel> _item;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _item = RoboModelItem().item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RoboTitle.homeAppBarTitle),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _item.length,
        itemBuilder: (context, index) {
          var product = _item[index];
          return Column(
            children: [
              _CustomListCardView(product: product),
            ],
          );
        },
      ),
    );
  }
}


//CUSTOM LİST CARD VİEW CLASS
class _CustomListCardView extends StatelessWidget {
  const _CustomListCardView({
    super.key,
    required this.product,
  });

  final RoboModel product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Card(
        child: Column(
          children: [
            Expanded(child: Image.asset(product.image, width: 250, fit: BoxFit.fill)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(product.name),
                Text("${product.price}")
              ],
            ),
          ],
        ),
      ),
    );
  }
}