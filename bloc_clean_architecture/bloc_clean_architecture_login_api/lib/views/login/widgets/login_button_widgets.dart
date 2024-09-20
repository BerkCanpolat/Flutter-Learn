import 'package:bloc_clean_architecture_login_api/login_bloc/login_bloc.dart';
import 'package:bloc_clean_architecture_login_api/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButtonWidgets extends StatelessWidget {
  final formKey;
  const LoginButtonWidgets({super.key, this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if(state.postApiStatus == PostApiStatus.error) {
          ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(state.message.toString())));
        }
        if(state.postApiStatus == PostApiStatus.loading) {
          ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text('Submitting..')));
        }
        if(state.postApiStatus == PostApiStatus.success) {
          ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(state.message.toString())));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => false,
      builder: (context, state) {
        return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          context.read<LoginBloc>().add(SubmitButtonEvent());
        }
      },
      child: const Text('Login'),
    );
      },
    ),
    );
  }
}
