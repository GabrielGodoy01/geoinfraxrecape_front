// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'dart:collection';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_auth_cognito_dart/src/jwt/src/header.dart';
import 'package:amplify_auth_cognito_dart/src/jwt/src/alg.dart';
import 'package:amplify_auth_cognito_dart/src/jwt/src/claims.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import 'package:clean_flutter_template/shared/helpers/errors/auth_errors.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/auth_repository_interface.dart';

class AuthRepositoryMock extends IAuthRepository {
  @override
  Future<Either<AuthErrors, List<AuthUserAttribute>>> getUserAttributes() {
    AuthUserAttribute user = const AuthUserAttribute(
        userAttributeKey: CognitoUserAttributeKey.custom('custom:role'),
        value: 'student');

    return Future.value(Right([user]));
  }

  @override
  Future<Either<AuthErrors, CognitoAuthSession>> loginUser(
      String email, String password) {
    LinkedHashMap map = LinkedHashMap.of(
        {'refreshToken': '123', 'accessToken': '123', 'idToken': '123'});
    JsonWebToken mockJsonWebToken = const JsonWebToken(
        header: JsonWebHeader(
          algorithm: Algorithm.ecdsaSha256,
        ),
        claims: JsonWebClaims(),
        signature: []);
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
    return Future.value(Right(cognitoAuthSession));
  }

  @override
  Future<Either<AuthErrors, void>> logoutUser() {
    return Future.value(const Right(null));
  }
}
