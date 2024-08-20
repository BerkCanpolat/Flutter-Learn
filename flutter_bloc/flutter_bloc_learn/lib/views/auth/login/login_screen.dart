import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/blocs/auth/login/login_bloc.dart';
import 'package:flutter_bloc_learn/blocs/auth/login/login_state.dart';
import 'package:flutter_bloc_learn/repository/auth/form_submission_status.dart';
import 'package:flutter_bloc_learn/repository/auth/login/login_repository.dart';
import 'package:flutter_bloc_learn/views/auth/login/widgets/form_widgets.dart';

class LoginScreen extends StatelessWidget {
 LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(authRepo: context.read<LoginRepository>()),
        //Child kısmında genel olarak dinleme yapıyoruz.
        child: BlocListener<LoginBloc, LoginState>(
          //Ne zaman dinliycez, ne zaman dinlemiycez.
          listenWhen: ((previous, current) => previous.formStatus != current.formStatus),
          //Neyi dinliyoruz.
          //Form durumuna göre fonksiyonlar dönücek
          listener: (context, state) {
            final formStatus = state.formStatus;
            if(formStatus is SubmissionFailed) {
              _showSnackBar(context, formStatus.exception.toString());
            }
          },
          //BlocListenerin içine yazıyoruz.
          child: Center(child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/t1.png', scale: 3,),
              FormWidgets()
            ],
          ),
          ),
        ),
      )
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}