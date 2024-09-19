import 'package:flutter/material.dart';

class EmailInputWidgets extends StatelessWidget {
  final FocusNode emailFocusNode;
  const EmailInputWidgets({super.key, required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: emailFocusNode,
      decoration: InputDecoration(
        hintText: 'Email',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter Email';
        }
        return null;
      },
      onChanged: (value) {},
    );
  }
}
