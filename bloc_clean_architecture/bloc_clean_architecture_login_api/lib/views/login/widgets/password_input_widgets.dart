import 'package:flutter/material.dart';

class PasswordInputWidgets extends StatelessWidget {
  final FocusNode passwordFocusNode;
  const PasswordInputWidgets({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: passwordFocusNode,
      decoration: InputDecoration(
        hintText: 'Password',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter Password';
        }
        return null;
      },
      onChanged: (value) {},
    );
  }
}
