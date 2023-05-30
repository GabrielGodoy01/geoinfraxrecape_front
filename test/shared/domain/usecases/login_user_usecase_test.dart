// ignore_for_file: depend_on_referenced_packages

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito_dart/src/jwt/src/header.dart';
import 'package:amplify_auth_cognito_dart/src/jwt/src/alg.dart';
import 'package:amplify_auth_cognito_dart/src/jwt/src/claims.dart';
import 'package:clean_flutter_template/shared/domain/repositories/auth_repository_interface.dart';
import 'package:clean_flutter_template/shared/domain/usecases/login_user_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/auth_errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_user_usecase_test.mocks.dart';

@GenerateMocks([IAuthRepository])
void main() {
  late ILoginUserUsecase usecase;
  IAuthRepository repository = MockIAuthRepository();
  String email = '';
  String password = '';

  JsonWebToken mockJsonWebToken = const JsonWebToken(
      header: JsonWebHeader(
        algorithm: Algorithm.ecdsaSha256,
      ),
      claims: JsonWebClaims(),
      signature: []);

  setUp(() {
    usecase = LoginUserUsecase(repository: repository);
  });

  test('[TEST] - login returns success CognitoAuthSession', () async {
    when(repository.loginUser(email, password)).thenAnswer(
      (realInvocation) async => Right(CognitoAuthSession(
          isSignedIn: true,
          credentialsResult:
              const AWSResult.success(AWSCredentials('123', '123', '123')),
          identityIdResult: const AWSResult.success('123'),
          userSubResult: const AWSResult.success('123'),
          userPoolTokensResult: AWSResult.success(CognitoUserPoolTokens(
              accessToken: mockJsonWebToken,
              idToken: mockJsonWebToken,
              refreshToken: "refreshToken")))),
    );
    var result = await usecase(email, password);
    expect(result.fold(id, id), isA<CognitoAuthSession>());
  });

  test('[TEST] - login returns error', () async {
    when(repository.loginUser(email, password)).thenAnswer(
      (realInvocation) async => Left(AuthErrors(message: '')),
    );
    var result = await usecase(email, password);
    expect(result.fold(id, id), isA<AuthErrors>());
  });
}
