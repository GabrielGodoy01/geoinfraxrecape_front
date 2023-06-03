import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';

import '../../helpers/errors/auth_errors.dart';
import '../repositories/auth_repository_interface.dart';

abstract class ILoginWithNewPasswordUsecase {
  Future<Either<AuthErrors, SignInResult>> call(
      String email, String password, String newPassword);
}

class LoginWithNewPasswordUsecase extends ILoginWithNewPasswordUsecase {
  final IAuthRepository repository;

  LoginWithNewPasswordUsecase({required this.repository});

  @override
  Future<Either<AuthErrors, SignInResult>> call(
      String email, String password, String newPassword) async {
    var result =
        await repository.loginWithNewPassword(email, password, newPassword);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
