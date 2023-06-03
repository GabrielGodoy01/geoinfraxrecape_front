// ignore_for_file: depend_on_referenced_packages

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:clean_flutter_template/app/app_module.dart';
import 'package:clean_flutter_template/app/modules/auth/auth_module.dart';
import 'package:clean_flutter_template/shared/domain/repositories/auth_repository_interface.dart';
import 'package:clean_flutter_template/shared/helpers/errors/auth_errors.dart';
import 'package:clean_flutter_template/shared/infra/external/http/auth_datasouce_interface.dart';
import 'package:clean_flutter_template/shared/infra/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks([IAuthDatasource])
void main() {
  initModules([AppModule(), AuthModule()]);
  IAuthDatasource datasource = MockIAuthDatasource();
  late IAuthRepository repository;
  String email = '';
  String password = '';

  SignInResult signInResult = const SignInResult(
      isSignedIn: true,
      nextStep: AuthNextSignInStep(signInStep: AuthSignInStep.done));

  setUp(() {
    repository = AuthRepository(datasource: datasource);
  });

  group('[TEST] - loginUser', () {
    test('returns success SignInResult', () async {
      when(datasource.postLoginUser(email, password))
          .thenAnswer((realInvocation) async => Right(signInResult));
      var result = await repository.loginUser(email, password);
      expect(result.fold(id, id), isA<SignInResult>());
    });

    test('returns error', () async {
      when(datasource.postLoginUser(email, password))
          .thenAnswer((realInvocation) async => Left(AuthErrors(message: '')));
      var result = await repository.loginUser(email, password);
      expect(result.fold(id, id), isA<AuthErrors>());
    });
  });

  group('[TEST] - logoutUser', () {
    test('returns success void', () async {
      when(datasource.postLogout())
          .thenAnswer((realInvocation) async => const Right(null));
      var result = await repository.logoutUser();
      expect(result.fold((l) => l, (r) => null), isA<void>());
    });

    test('returns error', () async {
      when(datasource.postLogout())
          .thenAnswer((realInvocation) async => Left(AuthErrors(message: '')));
      var result = await repository.logoutUser();
      expect(result.fold((l) => l, (r) => null), isA<AuthErrors>());
    });
  });

  group('[TEST] - getUserAttributes', () {
    test('returns success void', () async {
      AuthUserAttribute user = const AuthUserAttribute(
          userAttributeKey: CognitoUserAttributeKey.custom('custom:role'),
          value: 'student');
      when(datasource.getUserAttributes())
          .thenAnswer((realInvocation) async => Right([user]));
      var result = await repository.getUserAttributes();
      expect(result.fold((l) => l, (r) => null), isA<void>());
    });

    test('returns error', () async {
      when(datasource.getUserAttributes())
          .thenAnswer((realInvocation) async => Left(AuthErrors(message: '')));
      var result = await repository.getUserAttributes();
      expect(result.fold((l) => l, (r) => null), isA<AuthErrors>());
    });
  });

  group('[TEST] - forgotPassword', () {
    test('returns success void', () async {
      when(datasource.postForgotPassword('gabriel.godoybz@hotmail.com'))
          .thenAnswer((realInvocation) async => const Right(null));
      var result =
          await repository.forgotPassword('gabriel.godoybz@hotmail.com');
      expect(result.fold((l) => l, (r) => null), isA<void>());
    });

    test('returns error', () async {
      when(datasource.postForgotPassword('gabriel.godoybz@hotmail.com'))
          .thenAnswer((realInvocation) async => Left(AuthErrors(message: '')));
      var result =
          await repository.forgotPassword('gabriel.godoybz@hotmail.com');
      expect(result.fold((l) => l, (r) => null), isA<AuthErrors>());
    });
  });

  group('[TEST] - changePassword', () {
    test('returns success void', () async {
      when(datasource.postChangePassword('', '', ''))
          .thenAnswer((realInvocation) async => const Right(null));
      var result = await repository.changePassword('', '', '');
      expect(result.fold((l) => l, (r) => null), isA<void>());
    });

    test('returns error', () async {
      when(datasource.postChangePassword('', '', ''))
          .thenAnswer((realInvocation) async => Left(AuthErrors(message: '')));
      var result = await repository.changePassword('', '', '');
      expect(result.fold((l) => l, (r) => null), isA<AuthErrors>());
    });
  });
}
