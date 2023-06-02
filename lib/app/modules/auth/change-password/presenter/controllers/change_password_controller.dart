import 'package:mobx/mobx.dart';

import '../../../../../../shared/domain/usecases/change_password_usecase.dart';
import '../../../../../../shared/helpers/utils/validation_helper.dart';
import '../states/change_password_state.dart';

part 'change_password_controller.g.dart';

class ChangePasswordController = ChangePasswordControllerBase
    with _$ChangePasswordController;

abstract class ChangePasswordControllerBase with Store {
  final IChangePasswordUsecase _changePassword;
  final String email;

  ChangePasswordControllerBase(this._changePassword, this.email);

  @observable
  ChangePasswordState state = ChangePasswordInitialState();

  @action
  void changeState(ChangePasswordState value) => state = value;

  @observable
  bool isPasswordVisible = true;

  @action
  void changePasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  @observable
  bool isConfirmPasswordVisible = true;

  @action
  void changeConfirmPasswordVisibility() =>
      isPasswordVisible = !isPasswordVisible;

  @observable
  String code = '';

  @action
  void setCode(String value) => code = value;

  @observable
  String newPassword = '';

  @action
  void setNewPassword(String value) => newPassword = value;

  @observable
  String confirmNewPassword = '';

  @action
  void setConfirmNewPassword(String value) => confirmNewPassword = value;

  @action
  String? validatePassword(String? password) {
    return ValidationHelper.validatePassword(password);
  }

  @action
  String? validateConfirmPassword(String? confirmPassword) {
    return ValidationHelper.validateConfirmPassword(
        newPassword, confirmPassword);
  }

  @action
  Future<void> changePassword() async {
    state = ChangePasswordLoadingState();
    var result = await _changePassword(email, code, newPassword);
    state = result.fold((failure) {
      return ChangePasswordErrorState(error: failure);
    }, (isConfirmed) {
      return const ChangePasswordSuccessState();
    });
  }

  @action
  String? validateCode(String? code) {
    return ValidationHelper.validateCode(code);
  }
}
