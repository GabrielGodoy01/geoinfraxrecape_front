import 'package:dartz/dartz.dart';

import '../../helpers/errors/auth_errors.dart';
import '../repositories/auth_repository_interface.dart';

abstract class IChangePasswordUsecase {
  Future<Either<AuthErrors, void>> call(
      String email, String newPassword, String confirmationCode);
}

class ChangePasswordUsecase extends IChangePasswordUsecase {
  final IAuthRepository repository;

  ChangePasswordUsecase({required this.repository});

  @override
  Future<Either<AuthErrors, void>> call(
      String email, String newPassword, String confirmationCode) async {
    var result =
        await repository.changePassword(email, newPassword, confirmationCode);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
