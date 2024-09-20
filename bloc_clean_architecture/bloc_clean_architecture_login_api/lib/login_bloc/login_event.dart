part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable{
  const LoginEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EmailChanged extends LoginEvent{
  final String email;
  const EmailChanged({required this.email});

  @override
  // TODO: implement props
  List<Object?> get props => [email];
}

class EmailUnFocused extends LoginEvent{}


class PasswordChanged extends LoginEvent{
  final String password;
  const PasswordChanged({required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [password];
}

class PasswordUnFocused extends LoginEvent{}

class SubmitButtonEvent extends LoginEvent{}