import 'package:bloc_api/bloc_user_api_project/user_model/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable{}

class UserLoadingState extends UserState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserLoadedState extends UserState{
  //final List<UserModel> user;
  final UserDataModel user;
  UserLoadedState(this.user);

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}

class UserErrorState extends UserState {
  final String message;
  UserErrorState(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}