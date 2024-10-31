import 'package:bloc_api/bloc_user_api_project/repository/repository_user.dart';
import 'package:bloc_api/bloc_user_api_project/user_bloc/user_event.dart';
import 'package:bloc_api/bloc_user_api_project/user_bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  final UserRepository _userRepository;
  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>(_onUser);
  }

  Future<void> _onUser(LoadUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    try {
      final users = await _userRepository.getUsers();
      emit(UserLoadedState(users));
    } catch (e) {
      emit(UserErrorState(e.toString())); 
    }
  }
  
}