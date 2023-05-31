import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import '../../../helpers/errors/auth_errors.dart';

abstract class IAuthDatasource {
  Future<Either<AuthErrors, CognitoAuthSession>> postLoginUser(
      String email, String password);
  Future<Either<AuthErrors, void>> postLogout();
  Future<Either<AuthErrors, List<AuthUserAttribute>>> getUserAttributes();
}
