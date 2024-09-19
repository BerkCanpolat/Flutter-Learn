import 'package:bloc_clean_architecture_login_api/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordInputWidgets extends StatelessWidget {
  final FocusNode passwordFocusNode;
  const PasswordInputWidgets({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
      focusNode: passwordFocusNode,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Password',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter Password';
        }
        if(value.length < 6) {
          return 'Your password cannot be shorter than 6';
        }
        return null;
      },
      onChanged: (value) {
        context.read<LoginBloc>().add(PasswordChanged(password: value));
      },
    );
      },
    );
  }
}
