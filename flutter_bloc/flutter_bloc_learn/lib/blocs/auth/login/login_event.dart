//Bütün olaylarımız için ayrı ayrı sınıf oluşturduğumuz alan.
//2 textfield'a sahip olduğumuz için 2 ayrı sınıfa sahip olmak zorundayız.


import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {

}

class LoginUserNameChanged extends LoginEvent {
  final String? username;

  LoginUserNameChanged({this.username});
  @override
  // TODO: implement props
  List<Object?> get props => [username];

}

class LoginPasswordChanged extends LoginEvent {
  final String? password;

  LoginPasswordChanged({this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [password];
}

class LoginSubmitted extends LoginEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}