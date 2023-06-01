import 'dart:ui';

import 'package:clean_flutter_template/app/modules/auth/logout/presenter/controllers/logout_controller.dart';
import 'package:clean_flutter_template/app/modules/auth/logout/presenter/states/logout_state.dart';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/storage/auth_storage_interface.dart';
import 'package:clean_flutter_template/shared/domain/usecases/logout_user_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/auth_errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logout_controller_test.mocks.dart';

class ModularNavigateMock extends Mock implements IModularNavigator {}

@GenerateMocks([ILogoutUserUsecase, IAuthStorage])
void main() {
  late LogoutController controller;
  ILogoutUserUsecase usecase = MockILogoutUserUsecase();
  final navigate = ModularNavigateMock();

  setUp(() async {
    controller = LogoutController(usecase);
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
    Modular.navigatorDelegate = navigate;
  });

  group('[TEST] - logoutUser', () {
    test('must return LogoutSuccessState', () async {
      when(usecase.call()).thenAnswer((_) async => const Right(null));
      await controller.logoutUser();
      expect(controller.state, isA<LogoutSuccessState>());
    });

    test('must return LogoutErrorState', () async {
      when(usecase.call())
          .thenAnswer((_) async => Left(AuthErrors(message: '')));
      await controller.logoutUser();
      expect(controller.state, isA<LogoutErrorState>());
    });
  });

  group('[TEST] - setter', () {
    test('changeState', () {
      controller.changeState(const LogoutSuccessState());
      expect(controller.state, isA<LogoutSuccessState>());
    });
  });
}
