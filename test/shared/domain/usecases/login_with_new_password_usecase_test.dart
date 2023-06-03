import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:clean_flutter_template/shared/domain/repositories/auth_repository_interface.dart';
import 'package:clean_flutter_template/shared/domain/usecases/login_with_new_password_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/auth_errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_with_new_password_usecase_test.mocks.dart';

@GenerateMocks([IAuthRepository])
void main() {
  late ILoginWithNewPasswordUsecase usecase;
  IAuthRepository repository = MockIAuthRepository();
  String email = '';
  String password = '';

  SignInResult signInResult = const SignInResult(
      isSignedIn: true,
      nextStep: AuthNextSignInStep(signInStep: AuthSignInStep.done));

  setUp(() {
    usecase = LoginWithNewPasswordUsecase(repository: repository);
  });

  test('[TEST] - loginWithNewPassword returns success SignInResult', () async {
    when(repository.loginWithNewPassword(email, password, '')).thenAnswer(
      (realInvocation) async => Right(signInResult),
    );
    var result = await usecase(email, password, '');
    expect(result.fold(id, id), isA<SignInResult>());
  });

  test('[TEST] - loginWithNewPassword returns error', () async {
    when(repository.loginWithNewPassword(email, password, '')).thenAnswer(
      (realInvocation) async => Left(AuthErrors(message: '')),
    );
    var result = await usecase(email, password, '');
    expect(result.fold(id, id), isA<AuthErrors>());
  });
}
