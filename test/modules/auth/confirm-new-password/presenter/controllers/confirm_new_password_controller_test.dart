import 'dart:ui';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:clean_flutter_template/app/modules/auth/confirm-new-password/presenter/controller/confirm_new_password_controller.dart';
import 'package:clean_flutter_template/app/modules/auth/confirm-new-password/presenter/state/confirm_new_password_state.dart';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/usecases/login_with_new_password_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/auth_errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'confirm_new_password_controller_test.mocks.dart';

@GenerateMocks([
  ILoginWithNewPasswordUsecase,
])
void main() {
  late ConfirmNewPasswordController controller;
  ILoginWithNewPasswordUsecase usecase = MockILoginWithNewPasswordUsecase();

  setUp(() async {
    controller = ConfirmNewPasswordController(usecase);
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  SignInResult signInResult = const SignInResult(
      isSignedIn: true,
      nextStep: AuthNextSignInStep(signInStep: AuthSignInStep.done));

  group('[TEST] - loginWithNewPassword', () {
    test('must return ConfirmNewPasswordSuccessState', () async {
      when(usecase.call('', '', ''))
          .thenAnswer((_) async => Right(signInResult));
      await controller.loginWithNewPassword('', '');
      expect(controller.state, isA<ConfirmNewPasswordSuccessState>());
    });

    test('must return ConfirmNewPasswordErrorState', () async {
      when(usecase.call('', '', ''))
          .thenAnswer((_) async => Left(AuthErrors(message: '')));
      await controller.loginWithNewPassword('', '');
      expect(controller.state, isA<ConfirmNewPasswordErrorState>());
    });
  });

  group('[TEST] - setter', () {
    test('setPassword', () {
      controller.setPassword('password');
      expect(controller.newPassword, 'password');
    });

    test('changeState', () {
      controller.changeState(const ConfirmNewPasswordSuccessState());
      expect(controller.state, isA<ConfirmNewPasswordSuccessState>());
    });

    test('changePasswordState', () {
      controller.changePasswordVisibility();
      expect(controller.isPasswordVisible, false);
    });
  });

  test('[TEST] - validatePassword', () {
    expect(controller.validatePassword(''), S.current.requiredFieldAlert);
    expect(controller.validatePassword('0'), S.current.invalidPasswordAlert);
    expect(controller.validatePassword('Teste123!'), null);
  });
}
