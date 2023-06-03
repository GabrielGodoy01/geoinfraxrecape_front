import '../../../../../../shared/helpers/errors/auth_errors.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginNewPasswordState extends LoginState {}

class LoginSuccessState extends LoginState {
  const LoginSuccessState();
}

class LoginErrorState extends LoginState {
  final AuthErrors error;

  const LoginErrorState(this.error);
}
