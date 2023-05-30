import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import '../../helpers/errors/auth_errors.dart';

abstract class IAuthRepository {
  Future<Either<AuthErrors, CognitoAuthSession>> loginUser(
      String email, String password);
  Future<Either<AuthErrors, void>> logoutUser();
  Future<Either<AuthErrors, List<AuthUserAttribute>>> getUserAttributes();
}