import 'package:mobx/mobx.dart';
import '../../../../../../shared/domain/usecases/login_with_new_password_usecase.dart';
import '../../../../../../shared/helpers/utils/validation_helper.dart';
import '../state/confirm_new_password_state.dart';

part 'confirm_new_password_controller.g.dart';

class ConfirmNewPasswordController = ConfirmNewPasswordControllerBase
    with _$ConfirmNewPasswordController;

abstract class ConfirmNewPasswordControllerBase with Store {
  final ILoginWithNewPasswordUsecase _loginWithNewPassword;

  ConfirmNewPasswordControllerBase(this._loginWithNewPassword);

  @observable
  ConfirmNewPasswordState state = ConfirmNewPasswordInitialState();

  @action
  void changeState(ConfirmNewPasswordState value) => state = value;

  @observable
  bool isPasswordVisible = true;

  @action
  void changePasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  @observable
  String newPassword = '';

  @action
  void setPassword(String value) => newPassword = value;

  @action
  String? validatePassword(String? value) {
    return ValidationHelper.validatePassword(value);
  }

  @action
  Future<void> loginWithNewPassword(String email, String password) async {
    state = ConfirmNewPasswordLoadingState();
    var result = await _loginWithNewPassword(email, password, newPassword);
    state = result.fold((failure) {
      return ConfirmNewPasswordErrorState(error: failure);
    }, (changed) {
      return const ConfirmNewPasswordSuccessState();
    });
    if (state is ConfirmNewPasswordSuccessState) {
      // ignore: avoid_print
      print('consegui trocar a senha');
    }
  }
}
