import 'package:clean_flutter_template/shared/domain/repositories/auth_repository_interface.dart';
import 'package:clean_flutter_template/shared/domain/usecases/change_password_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/auth_errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'logout_user_usecase_test.mocks.dart';

@GenerateMocks([IAuthRepository])
void main() {
  late IChangePasswordUsecase useCase;
  IAuthRepository repository = MockIAuthRepository();
  String email = '';
  String confirmationCode = '';
  String newPassword = '';

  setUp(() {
    useCase = ChangePasswordUsecase(repository: repository);
  });

  test('[TEST] - change password returns success void', () async {
    when(repository.changePassword(email, newPassword, confirmationCode))
        .thenAnswer(
      (realInvocation) async => const Right(null),
    );
    var result = await useCase(email, newPassword, confirmationCode);
    expect(result.fold((l) => l, (r) => null), isA<void>());
  });

  test('[TEST] - change password returns error', () async {
    when(repository.changePassword(email, newPassword, confirmationCode))
        .thenAnswer(
      (realInvocation) async => Left(AuthErrors(message: '')),
    );
    var result = await useCase(email, newPassword, confirmationCode);
    expect(result.fold((l) => l, (r) => null), isA<AuthErrors>());
  });
}
