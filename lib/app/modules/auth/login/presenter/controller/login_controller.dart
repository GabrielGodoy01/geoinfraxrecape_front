import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../../../../shared/domain/usecases/login_user_usecase.dart';
import '../../../../../../shared/helpers/utils/validation_helper.dart';
import '../states/login_state.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final ILoginUserUsecase _login;
  // final IAuthStorage storage;
  // final IGetUserAttributesUsecase _getUserAttributes;

  LoginControllerBase(this._login);

  @observable
  LoginState state = LoginInitialState();

  @action
  void changeState(LoginState value) => state = value;

  @observable
  bool isPasswordVisible = true;

  @action
  void changePasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @action
  String? validateEmail(String? value) {
    return ValidationHelper.validateEmail(value);
  }

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @action
  String? validatePassword(String? value) {
    return ValidationHelper.validatePassword(value);
  }

  @action
  Future<void> loginWithEmail() async {
    changeState(LoginLoadingState());
    var loginResult = await _login(email, password);
    loginResult.fold((failure) {
      return changeState(LoginErrorState(failure));
    }, (authSession) async {
      changeState(authSession.nextStep.signInStep ==
              AuthSignInStep.confirmSignInWithNewPassword
          ? LoginNewPasswordState()
          : const LoginSuccessState());
    });
    if (state is LoginNewPasswordState) {
      Modular.to.navigate('/confirm-new-password', arguments: {
        'email': email,
        'password': password,
      });
    } else if (state is LoginSuccessState) {
      Modular.to.navigate('/home');
    }
  }
}
