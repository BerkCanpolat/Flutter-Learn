import 'package:flutter/material.dart';
import 'package:flutter_full_learn/core/random_image.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({super.key});
  final double _cardHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: RandomImage(),
                  bottom: _cardHeight / 2,
                ),
                Positioned(
                    height: _cardHeight,
                    bottom: 0,
                    width: 200,
                    child: _cardCustom())
              ],
            ),
          ),
          Spacer(
            flex: 6,
          ),
        ],
      ),
    );
  }

  Card _cardCustom() {
    return Card(
      color: Colors.grey,
      shape: RoundedRectangleBorder(),
    );
  }
}
