import 'package:bloc_clean_architecture_login_api/login_bloc/login_bloc.dart';
import 'package:bloc_clean_architecture_login_api/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailInputWidgets extends StatelessWidget {
  final FocusNode emailFocusNode;
  const EmailInputWidgets({super.key, required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
      focusNode: emailFocusNode,
      decoration: const InputDecoration(
        hintText: 'Email',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter Email';
        }
        if(!Validations.emailValidator(value)) {
          return 'Email is not correct';
        }
        return null;
      },
      onChanged: (value) {
        context.read<LoginBloc>().add(EmailChanged(email: value));
      },
    );
      },
    );
  }
}
