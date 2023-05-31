// ignore_for_file: depend_on_referenced_packages

import 'dart:collection';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito_dart/src/jwt/src/header.dart';
import 'package:amplify_auth_cognito_dart/src/jwt/src/alg.dart';
import 'package:amplify_auth_cognito_dart/src/jwt/src/claims.dart';
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
    controller = LoginController(usecase, getUserAttributes);
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  JsonWebToken mockJsonWebToken = const JsonWebToken(
      header: JsonWebHeader(
        algorithm: Algorithm.ecdsaSha256,
      ),
      claims: JsonWebClaims(),
      signature: []);

  LinkedHashMap map = LinkedHashMap.of(
      {'refreshToken': '123', 'accessToken': '123', 'idToken': '123'});

  AuthUserAttribute user = const AuthUserAttribute(
      userAttributeKey: CognitoUserAttributeKey.custom('custom:role'),
      value: 'student');

  CognitoAuthSession cognitoAuthSession = CognitoAuthSession(
      isSignedIn: true,
      credentialsResult:
          const AWSResult.success(AWSCredentials('123', '123', '123')),
      identityIdResult: const AWSResult.success('123'),
      userSubResult: const AWSResult.success('123'),
      userPoolTokensResult: AWSResult.success(CognitoUserPoolTokens(
          accessToken: mockJsonWebToken,
          idToken: mockJsonWebToken,
          refreshToken: map['refreshToken'])));

  group('[TEST] - loginWithEmail', () {
    test('must return LoginSuccessState', () async {
      when(usecase.call('', ''))
          .thenAnswer((_) async => Right(cognitoAuthSession));
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
      controller
          .changeState(LoginSuccessState(authSession: cognitoAuthSession));
      expect(controller.state, isA<LoginSuccessState>());
    });
  });
}
