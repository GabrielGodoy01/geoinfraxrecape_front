import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:clean_flutter_template/app/app_module.dart';
import 'package:clean_flutter_template/app/modules/auth/auth_module.dart';
import 'package:clean_flutter_template/shared/domain/repositories/auth_repository_interface.dart';
import 'package:clean_flutter_template/shared/infra/repositories/auth_repository_mock.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

void main() {
  initModules([AppModule(), AuthModule()]);
  late IAuthRepository repository;
  String email = '';
  String password = '';

  setUp(() {
    repository = AuthRepositoryMock();
  });

  group('[TEST] - loginUser', () {
    test('returns success CognitoAuthSession', () async {
      var result = await repository.loginUser(email, password);
      expect(result.fold(id, id), isA<CognitoAuthSession>());
    });
  });

  group('[TEST] - logoutUser', () {
    test('returns success void', () async {
      var result = await repository.logoutUser();
      expect(result.fold((l) => l, (r) => null), isA<void>());
    });
  });

  group('[TEST] - getUserAttributes', () {
    test('returns success void', () async {
      var result = await repository.getUserAttributes();
      expect(result.fold((l) => l, (r) => null), isA<void>());
    });
  });
}
