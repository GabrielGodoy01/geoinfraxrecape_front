import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import '../../helpers/errors/auth_errors.dart';
import '../../domain/repositories/auth_repository_interface.dart';
import '../external/http/auth_datasouce_interface.dart';

class AuthRepository extends IAuthRepository {
  final IAuthDatasource datasource;

  AuthRepository({required this.datasource});

  @override
  Future<Either<AuthErrors, SignInResult>> loginUser(
      String email, String password) async {
    var result = await datasource.postLoginUser(email, password);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }

  @override
  Future<Either<AuthErrors, void>> logoutUser() async {
    var result = await datasource.postLogout();
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }

  @override
  Future<Either<AuthErrors, List<AuthUserAttribute>>>
      getUserAttributes() async {
    var result = await datasource.getUserAttributes();
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }

  @override
  Future<Either<AuthErrors, void>> forgotPassword(String email) async {
    var result = await datasource.postForgotPassword(email);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }

  @override
  Future<Either<AuthErrors, void>> changePassword(
      String email, String newPassword, String confirmationCode) async {
    var result = await datasource.postChangePassword(
        email, newPassword, confirmationCode);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
