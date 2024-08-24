import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/views/auth/login/widgets/login_button.dart';
import 'package:flutter_bloc_learn/views/auth/login/widgets/password_textfield.dart';
import 'package:flutter_bloc_learn/views/auth/login/widgets/username_textfield.dart';

class FormWidgets extends StatefulWidget {
 FormWidgets({super.key});

  @override
  State<FormWidgets> createState() => _FormWidgetsState();
}

class _FormWidgetsState extends State<FormWidgets> {
  final GlobalKey formKey = GlobalKey();

  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
        key: formKey,
        children: [
          UsernameTextfield(),
          PasswordTextfield(),
          LoginButton(formKey: formKey,)
        ],
      ),
    );
  }
}