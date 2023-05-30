// ignore_for_file: depend_on_referenced_packages

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito_dart/src/jwt/src/header.dart';
import 'package:amplify_auth_cognito_dart/src/jwt/src/alg.dart';
import 'package:amplify_auth_cognito_dart/src/jwt/src/claims.dart';
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

  JsonWebToken mockJsonWebToken = const JsonWebToken(
      header: JsonWebHeader(
        algorithm: Algorithm.ecdsaSha256,
      ),
      claims: JsonWebClaims(),
      signature: []);

  setUp(() {
    repository = AuthRepository(datasource: datasource);
  });

  group('[TEST] - loginUser', () {
    test('returns success CognitoAuthSession', () async {
      when(datasource.postLoginUser(email, password)).thenAnswer(
          (realInvocation) async => Right(CognitoAuthSession(
              isSignedIn: true,
              credentialsResult:
                  const AWSResult.success(AWSCredentials('123', '123', '123')),
              identityIdResult: const AWSResult.success('123'),
              userSubResult: const AWSResult.success('123'),
              userPoolTokensResult: AWSResult.success(CognitoUserPoolTokens(
                  accessToken: mockJsonWebToken,
                  idToken: mockJsonWebToken,
                  refreshToken: '123')))));
      var result = await repository.loginUser(email, password);
      expect(result.fold(id, id), isA<CognitoAuthSession>());
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
}
