import 'package:flutter/material.dart';
import 'package:flutter_full_learn/demos/password_text_field_demos.dart';

class TextFieldSpecialView extends StatefulWidget {
  const TextFieldSpecialView({super.key});

  @override
  State<TextFieldSpecialView> createState() => _TextFieldSpecialViewState();
}

class _TextFieldSpecialViewState extends State<TextFieldSpecialView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          PasswordTextFieldDemos()
        ],
      ),
    );
  }
}