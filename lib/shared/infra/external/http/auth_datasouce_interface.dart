import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import '../../../helpers/errors/auth_errors.dart';

abstract class IAuthDatasource {
  Future<Either<AuthErrors, SignInResult>> postLoginUser(
      String email, String password);
  Future<Either<AuthErrors, void>> postLogout();
  // Future<Either<AuthErrors, User>> postRegisterUser(UserModel user);
  Future<Either<AuthErrors, void>> postEmailConfirmation(
      String email, String confirmationCode);
  Future<Either<AuthErrors, void>> postForgotPassword(String email);
  Future<Either<AuthErrors, void>> postChangePassword(
      String email, String newPassword, String confirmationCode);
  // Future<Either<AuthErrors, void>> postResendCode(String email);
  Future<Either<AuthErrors, List<AuthUserAttribute>>> getUserAttributes();
}
