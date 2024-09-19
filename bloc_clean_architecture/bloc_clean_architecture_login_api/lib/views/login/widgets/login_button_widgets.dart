import 'package:bloc_clean_architecture_login_api/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButtonWidgets extends StatelessWidget {
  final formKey;
  const LoginButtonWidgets({super.key, this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          if(state.password.length < 6) {
            print('6 Dan kısa olamaz');
          }
        }
      },
      child: const Text('Login'),
    );
      },
    );
  }
}
