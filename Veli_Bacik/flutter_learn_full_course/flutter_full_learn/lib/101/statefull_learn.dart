import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/counter_hello_button.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({super.key});

  //Parametreleri buraya veririz.

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  //Hayatı burada belirleriz. Değişiklikler burada olur
  int countValue = 0;
  int _counterCustom = 0;

  void _updateCounter(bool isIncrement) {
    if (isIncrement) {
      countValue += 1;
    } else {
      countValue -= 1;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LanguageItems.welcomeTitle),),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _incrementButton(),
          _deincrementButton(),
        ],
      ),
      body: Column(
        children: [
          Center(child: Text(countValue.toString())),
          Placeholder(),
          CounterHelloButotn(),
        ],
      ),
    );
  }

  FloatingActionButton _deincrementButton() {
    return FloatingActionButton(
      onPressed: () {
        _updateCounter(false);
      },
      child: Icon(Icons.add),
    );
  }

  FloatingActionButton _incrementButton() {
    print('burda');
    return FloatingActionButton(
      onPressed: () {
        _updateCounter(true);
      },
      child: Icon(Icons.add),
    );
  }
}
