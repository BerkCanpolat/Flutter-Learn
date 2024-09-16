import 'package:bloc_zero_to_hero/bloc/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginBloc _loginBloc;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Bloc'),
      ),
      body: BlocProvider(
        create: (_) => _loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) =>
                    previous.email != current.email,
                builder: (context, state) {
                  return TextFormField(
                    focusNode: emailFocusNode,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Email'),
                    onChanged: (value) {
                      context.read<LoginBloc>().add(EmailEvent(email: value));
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) =>
                    previous.password != current.password,
                builder: (context, state) {
                  return TextFormField(
                    focusNode: passwordFocusNode,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Password'),
                    onChanged: (value) {
                      context
                          .read<LoginBloc>()
                          .add(PasswordEvent(password: value));
                    },
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              BlocListener<LoginBloc, LoginState>(
                listenWhen: (previous, current) =>
                    previous.loginStatus != current.loginStatus,
                listener: (context, state) {
                  if (state.loginStatus == LoginStatus.error) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                          SnackBar(content: Text(state.message.toString())));
                  }
                  if (state.loginStatus == LoginStatus.loading) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                          const SnackBar(content: Text('Submitting')));
                  }
                  if (state.loginStatus == LoginStatus.success) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                          const SnackBar(content: Text('Login Successfull')));
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return ElevatedButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(LoginApiEvent());
                        },
                        child: const Text('Login'));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
