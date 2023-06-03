import '../../../../../../shared/helpers/errors/auth_errors.dart';

abstract class ConfirmNewPasswordState {
  const ConfirmNewPasswordState();
}

class ConfirmNewPasswordInitialState extends ConfirmNewPasswordState {}

class ConfirmNewPasswordLoadingState extends ConfirmNewPasswordState {}

class ConfirmNewPasswordSuccessState extends ConfirmNewPasswordState {
  const ConfirmNewPasswordSuccessState();
}

class ConfirmNewPasswordErrorState extends ConfirmNewPasswordState {
  final AuthErrors error;

  const ConfirmNewPasswordErrorState({required this.error});
}
