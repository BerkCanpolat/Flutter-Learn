import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailEvent>(_emailMethod);
    on<PasswordEvent>(_passwordMethod);
    on<LoginApiEvent>(_loginMethod);
  }

  void _emailMethod(EmailEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }
  void _passwordMethod(PasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _loginMethod(LoginApiEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    Map data = {'email':state.email,'password':state.password};

    try {
      final response = await http.post(Uri.parse('https://reqres.in/api/login'), body: data);
      var datax = jsonDecode(response.body);
      if(response.statusCode == 200) {
        emit(state.copyWith(loginStatus: LoginStatus.success, message: 'Login Successfull'));
      } else {
        emit(state.copyWith(loginStatus: LoginStatus.error, message: datax['error']));
      }
    } catch (e) {
      emit(state.copyWith(loginStatus: LoginStatus.error, message: e.toString()));
    }
  }
}
