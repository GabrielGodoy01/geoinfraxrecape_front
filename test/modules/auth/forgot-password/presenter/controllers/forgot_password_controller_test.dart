import 'dart:ui';

import 'package:clean_flutter_template/app/modules/auth/forgot-password/presenter/controllers/forgot_password_controller.dart';
import 'package:clean_flutter_template/app/modules/auth/forgot-password/presenter/states/forgot_password_state.dart';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/usecases/forgot_password_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/auth_errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'forgot_password_controller_test.mocks.dart';

@GenerateMocks([IForgotPasswordUsecase])
void main() {
  late ForgotPasswordController controller;
  IForgotPasswordUsecase usecase = MockIForgotPasswordUsecase();

  setUp(() async {
    controller = ForgotPasswordController(usecase);
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - forgotPasswordUser', () {
    test('must return ForgotPasswordSuccessState', () async {
      when(usecase.call('')).thenAnswer((_) async => const Right(null));
      await controller.forgotPasswordUser();
      expect(controller.state, isA<ForgotPasswordSuccessState>());
    });

    test('must return ForgotPasswordErrorState', () async {
      when(usecase.call(''))
          .thenAnswer((_) async => Left(AuthErrors(message: '')));
      await controller.forgotPasswordUser();
      expect(controller.state, isA<ForgotPasswordErrorState>());
    });
  });

  group('[TEST] - setter', () {
    test('changeState', () {
      controller.changeState(const ForgotPasswordSuccessState());
      expect(controller.state, isA<ForgotPasswordSuccessState>());
    });

    test('setEmail', () {
      controller.setEmail('email');
      expect(controller.email, 'email');
    });
  });
}
