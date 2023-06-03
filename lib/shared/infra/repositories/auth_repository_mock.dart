import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

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
  Future<Either<AuthErrors, SignInResult>> loginUser(
      String email, String password) {
    var signInResult = const SignInResult(
        isSignedIn: true,
        nextStep: AuthNextSignInStep(signInStep: AuthSignInStep.done));
    return Future.value(Right(signInResult));
  }

  @override
  Future<Either<AuthErrors, void>> logoutUser() {
    return Future.value(const Right(null));
  }

  @override
  Future<Either<AuthErrors, void>> forgotPassword(String email) {
    return Future.value(const Right(null));
  }

  @override
  Future<Either<AuthErrors, void>> changePassword(
      String email, String newPassword, String confirmationCode) {
    return Future.value(const Right(null));
  }

  @override
  Future<Either<AuthErrors, SignInResult>> loginWithNewPassword(
      String email, String password, String newPassword) {
    var signInResult = const SignInResult(
        isSignedIn: true,
        nextStep: AuthNextSignInStep(signInStep: AuthSignInStep.done));
    return Future.value(Right(signInResult));
  }
}
