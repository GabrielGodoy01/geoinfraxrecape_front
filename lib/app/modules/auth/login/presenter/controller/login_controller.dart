import 'package:mobx/mobx.dart';
import '../../../../../../shared/domain/usecases/get_user_attributes_usecase.dart';
import '../../../../../../shared/domain/usecases/login_user_usecase.dart';
import '../../../../../../shared/helpers/utils/validation_helper.dart';
import '../states/login_state.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final ILoginUserUsecase _login;
  // final IAuthStorage storage;
  final IGetUserAttributesUsecase _getUserAttributes;

  LoginControllerBase(this._login, this._getUserAttributes);

  @observable
  LoginState state = LoginInitialState();

  @action
  void changeState(LoginState value) => state = value;

  @observable
  bool isPasswordVisible = true;

  @action
  void changePasswordState() => isPasswordVisible = !isPasswordVisible;

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
    var userAttributes = await _getUserAttributes();
    userAttributes.fold((failure) => changeState(LoginErrorState(failure)),
        (attributes) {
      attributes
          .firstWhere((element) =>
              element.userAttributeKey.toString() ==
              'CognitoUserAttributeKey "custom:role"')
          .value;
    });
    loginResult.fold((failure) {
      return changeState(LoginErrorState(failure));
    }, (authSession) async {
      return changeState(LoginSuccessState(authSession: authSession));
    });
    if (state is LoginSuccessState) {
      // var successState = state as LoginSuccessState;
      // await storage.saveAccessToken(successState
      //     .authSession.userPoolTokensResult.value.accessToken
      //     .toString());
      // await storage.saveRefreshToken(successState
      //     .authSession.userPoolTokensResult.value.refreshToken
      //     .toString());
      // await storage.saveIdToken(successState
      //     .authSession.userPoolTokensResult.value.idToken
      //     .toString());
    }
  }
}
