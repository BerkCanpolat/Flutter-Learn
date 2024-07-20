import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Theme.of(context).colorScheme.error,
        child: Text(
          'Data', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.error),
          ),
      ),
    );
  }
}

class ColorsItems {
  static final Color porsche = Color(0xFFEDBF61);

  static final Color sulu = Color.fromRGBO(198, 237, 97, 1);
}