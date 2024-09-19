import 'package:flutter/material.dart';

class LoginButtonWidgets extends StatelessWidget {
  final formKey;
  const LoginButtonWidgets({super.key, this.formKey});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          print('GİRİŞE TIKLADIM');
        }
      },
      child: const Text('Login'),
    );
  }
}
