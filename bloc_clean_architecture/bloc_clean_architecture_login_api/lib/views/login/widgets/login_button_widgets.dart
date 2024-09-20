import 'package:bloc_clean_architecture_login_api/config/routes/routes_name.dart';
import 'package:bloc_clean_architecture_login_api/login_bloc/login_bloc.dart';
import 'package:bloc_clean_architecture_login_api/utils/enums.dart';
import 'package:bloc_clean_architecture_login_api/utils/flush_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButtonWidgets extends StatelessWidget {
  final formKey;
  const LoginButtonWidgets({super.key, this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) => previous.postApiStatus != current.postApiStatus,
      listener: (context, state) {
        if(state.postApiStatus == PostApiStatus.error) {
          FlushBarHelper.flushBarErrorMessage(state.message.toString(), context);
        }

        if(state.postApiStatus == PostApiStatus.success) {
          Navigator.pushNamedAndRemoveUntil(context, RoutesName.homeScreen, (root) => false);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.postApiStatus != current.postApiStatus,
      builder: (context, state) {
        return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          context.read<LoginBloc>().add(SubmitButtonEvent());
        }
      },
      child: state.postApiStatus == PostApiStatus.loading ? const CircularProgressIndicator() : const Text('Login'),
    );
      },
    ),
    );
  }
}
