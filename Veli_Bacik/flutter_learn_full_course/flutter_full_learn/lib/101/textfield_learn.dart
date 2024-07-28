import 'package:flutter/material.dart';
import 'package:flutter_full_learn/demos/password_text_field_demos.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

class TextfieldLearn extends StatefulWidget {
  const TextfieldLearn({super.key});

  @override
  State<TextfieldLearn> createState() => _TextfieldLearnState();
}

class _TextfieldLearnState extends State<TextfieldLearn> {
  final key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            maxLength: 15,
            buildCounter: (context, {required currentLength, required isFocused, required maxLength}) {
              return _animatedContainer(currentLength);
            },
            keyboardType:  TextInputType.emailAddress,
            autofillHints: [AutofillHints.email],
            textInputAction: TextInputAction.next,
            minLines: 2,
            maxLines: 4,
            decoration: _InputDecarotor().emailInput,
          ),
          PasswordTextFieldDemos()
        ],
      ),
    );
  }

  AnimatedContainer _animatedContainer(int currentLength) {
    return AnimatedContainer(
          key: key,
          duration: Duration(milliseconds: 100),
          //color: Colors.green[100 * ((currentLength ?? 0)~/2)],
          color: Colors.green,
          height: 10,
          width: 10.0 * (currentLength ?? 0),
        );
  }
}

class _InputDecarotor {
  final emailInput = const InputDecoration(
          prefixIcon: Icon(Icons.mail),
          border: OutlineInputBorder(),
          //İçerisinde saydam şekilde mail yazar
          hintText: LanguageItems.mailTitle,
          //Tıkladığımız zaman yazıyı yukarı taşır
          labelText: 'Mail',
          //Arka plan rengini değiştirir
          fillColor: Colors.white,
          filled: true,
          iconColor: Colors.red,
          labelStyle: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
        );
}