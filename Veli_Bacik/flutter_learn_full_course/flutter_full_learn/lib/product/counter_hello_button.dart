import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

class CounterHelloButotn extends StatefulWidget {
  const CounterHelloButotn({super.key});

  @override
  State<CounterHelloButotn> createState() => _CounterHelloButotnState();
}

class _CounterHelloButotnState extends State<CounterHelloButotn> {
  int _counterCustom = 0;
  final String _welcomeTitle = LanguageItems.welcomeTitle;
  void _updateCounter() {
    setState(() {
      ++_counterCustom;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: _updateCounter,
        child: Text('$_welcomeTitle $_counterCustom'));
  }
}
