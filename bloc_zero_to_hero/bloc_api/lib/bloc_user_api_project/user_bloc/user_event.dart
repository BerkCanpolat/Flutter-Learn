import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable{
  const UserEvent();
}

class LoadUserEvent extends UserEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}