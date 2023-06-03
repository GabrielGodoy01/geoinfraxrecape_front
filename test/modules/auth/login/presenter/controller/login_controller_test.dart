// ignore_for_file: depend_on_referenced_packages

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:clean_flutter_template/app/modules/auth/login/presenter/controller/login_controller.dart';
import 'package:clean_flutter_template/app/modules/auth/login/presenter/states/login_state.dart';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/storage/auth_storage_interface.dart';
import 'package:clean_flutter_template/shared/domain/usecases/get_user_attributes_usecase.dart';
import 'package:clean_flutter_template/shared/domain/usecases/login_user_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/auth_errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_controller_test.mocks.dart';

@GenerateMocks([
  ILoginUserUsecase,
  IAuthStorage,
  IGetUserAttributesUsecase,
])
void main() {
  late LoginController controller;
  ILoginUserUsecase usecase = MockILoginUserUsecase();
  IGetUserAttributesUsecase getUserAttributes = MockIGetUserAttributesUsecase();

  setUp(() async {
    controller = LoginController(usecase);
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  SignInResult signInResult = const SignInResult(
      isSignedIn: true,
      nextStep: AuthNextSignInStep(signInStep: AuthSignInStep.done));

  AuthUserAttribute user = const AuthUserAttribute(
      userAttributeKey: CognitoUserAttributeKey.custom('custom:role'),
      value: 'student');

  group('[TEST] - loginWithEmail', () {
    test('must return LoginSuccessState', () async {
      when(usecase.call('', '')).thenAnswer((_) async => Right(signInResult));
      when(getUserAttributes.call()).thenAnswer((_) async => Right([user]));
      await controller.loginWithEmail();
      expect(controller.state, isA<LoginSuccessState>());
    });

    test('must return LoginErrorState', () async {
      when(usecase.call('', ''))
          .thenAnswer((_) async => Left(AuthErrors(message: '')));
      when(getUserAttributes.call()).thenAnswer((_) async => Right([user]));
      await controller.loginWithEmail();
      expect(controller.state, isA<LoginErrorState>());
    });
  });

  group('[TEST] - setter', () {
    test('setEmail', () {
      controller.setEmail('email');
      expect(controller.email, 'email');
    });

    test('setPassword', () {
      controller.setPassword('password');
      expect(controller.password, 'password');
    });

    test('changeState', () {
      controller.changeState(const LoginSuccessState());
      expect(controller.state, isA<LoginSuccessState>());
    });

    test('changePasswordState', () {
      controller.changePasswordVisibility();
      expect(controller.isPasswordVisible, false);
    });
  });

  test('[TEST] - validateEmail', () {
    expect(controller.validateEmail(''), S.current.requiredFieldAlert);
    expect(controller.validateEmail('0'), S.current.invalidEmailAlert);
    expect(controller.validateEmail('gabriel.godoybz@hotmail.com'), null);
  });

  test('[TEST] - validatePassword', () {
    expect(controller.validatePassword(''), S.current.requiredFieldAlert);
    expect(controller.validatePassword('0'), S.current.invalidPasswordAlert);
    expect(controller.validatePassword('Teste123!'), null);
  });
}
