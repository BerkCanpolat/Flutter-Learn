import 'package:bloc/bloc.dart';
import 'package:bloc_clean_architecture_login_api/repository/auth/login_repository.dart';
import 'package:bloc_clean_architecture_login_api/service/sesion_manager/session_controller.dart';
import 'package:bloc_clean_architecture_login_api/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository;
  LoginBloc({required this.loginRepository}) : super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<SubmitButtonEvent>(_onSubmitButton);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onSubmitButton(SubmitButtonEvent event, Emitter<LoginState> emit) async {
    Map data = {'email':state.email, 'password':state.password};
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    await loginRepository.loginRepoApi(data).then((value) async {
      if(value.error.isNotEmpty) {
        await SessionController().saveUserInPreferences(value);
        await SessionController().getUserFromPreference();
        emit(state.copyWith(postApiStatus: PostApiStatus.error, message: value.error.toString()));
      } else {
        emit(state.copyWith(postApiStatus: PostApiStatus.success, message: 'Login Successfull'));
      }
    }).onError((error, stackTrace) {
      emit(state.copyWith(postApiStatus: PostApiStatus.error, message: error.toString()));
    },);
  }
}
