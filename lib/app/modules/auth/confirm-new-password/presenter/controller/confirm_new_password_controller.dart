import 'package:mobx/mobx.dart';

import '../../../../../../shared/domain/usecases/change_password_usecase.dart';
import '../../../../../../shared/helpers/utils/validation_helper.dart';
import '../state/confirm_new_password_state.dart';

part 'confirm_new_password_controller.g.dart';

class ConfirmNewPasswordController = ConfirmNewPasswordControllerBase
    with _$ConfirmNewPasswordController;

abstract class ConfirmNewPasswordControllerBase with Store {
  final IChangePasswordUsecase _changePassword;

  ConfirmNewPasswordControllerBase(this._changePassword);

  @observable
  ConfirmNewPasswordState state = ConfirmNewPasswordInitialState();

  @action
  void changeState(ConfirmNewPasswordState value) => state = value;

  @observable
  bool isPasswordVisible = true;

  @action
  void changePasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @action
  String? validatePassword(String? value) {
    return ValidationHelper.validatePassword(value);
  }

  @action
  Future<void> changePassword(String email) async {
    state = ConfirmNewPasswordLoadingState();
    var result = await _changePassword(email, 'code', 'newPassword');
    state = result.fold((failure) {
      return ConfirmNewPasswordErrorState(error: failure);
    }, (changed) {
      return const ConfirmNewPasswordSuccessState();
    });
  }
}
