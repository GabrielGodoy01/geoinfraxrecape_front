import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:clean_flutter_template/shared/domain/repositories/auth_repository_interface.dart';
import 'package:clean_flutter_template/shared/domain/usecases/login_user_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/auth_errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_user_usecase_test.mocks.dart';

@GenerateMocks([IAuthRepository])
void main() {
  late ILoginUserUsecase usecase;
  IAuthRepository repository = MockIAuthRepository();
  String email = '';
  String password = '';

  SignInResult signInResult = const SignInResult(
      isSignedIn: true,
      nextStep: AuthNextSignInStep(signInStep: AuthSignInStep.done));

  setUp(() {
    usecase = LoginUserUsecase(repository: repository);
  });

  test('[TEST] - login returns success CognitoAuthSession', () async {
    when(repository.loginUser(email, password)).thenAnswer(
      (realInvocation) async => Right(signInResult),
    );
    var result = await usecase(email, password);
    expect(result.fold(id, id), isA<CognitoAuthSession>());
  });

  test('[TEST] - login returns error', () async {
    when(repository.loginUser(email, password)).thenAnswer(
      (realInvocation) async => Left(AuthErrors(message: '')),
    );
    var result = await usecase(email, password);
    expect(result.fold(id, id), isA<AuthErrors>());
  });
}
