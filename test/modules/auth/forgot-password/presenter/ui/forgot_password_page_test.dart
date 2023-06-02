import 'package:clean_flutter_template/app/modules/auth/auth_module.dart';
import 'package:clean_flutter_template/app/modules/auth/forgot-password/presenter/controllers/forgot_password_controller.dart';
import 'package:clean_flutter_template/app/modules/auth/forgot-password/presenter/ui/forgot_password_page.dart';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/usecases/forgot_password_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/auth_errors.dart';
import 'package:clean_flutter_template/shared/widgets/auth_button_widget.dart';
import 'package:clean_flutter_template/shared/widgets/text_field_custom_widget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;

import '../controllers/forgot_password_controller_test.mocks.dart';

@GenerateMocks([IForgotPasswordUsecase])
void main() {
  late ForgotPasswordController controller;
  IForgotPasswordUsecase usecase = MockIForgotPasswordUsecase();

  setUp(() async {
    initModules([
      AuthModule()
    ], replaceBinds: [
      modular.Bind<IForgotPasswordUsecase>((i) => usecase),
    ]);
    controller = Modular.get<ForgotPasswordController>();
    usecase = Modular.get<IForgotPasswordUsecase>();
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  testWidgets('[TEST] - GetUserPage must show some widgets when initialize',
      (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: ForgotPasswordPage()));
    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(AuthButtonWidget), findsOneWidget);
    expect(find.byType(TextFieldCustomWidget), findsOneWidget);
    expect(find.text(S.current.forgotPasswordInstructions), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('[TEST] - GetUserPage must show ErrorWidget when create user',
      (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: ForgotPasswordPage()));
    when(usecase.call('gabriel.godoybz@hotmail.com'))
        .thenAnswer((_) async => left(AuthErrors(message: 'message')));
    await widgetTester.runAsync(
        () async => controller.setEmail('gabriel.godoybz@hotmail.com'));

    await widgetTester.runAsync(
        () async => controller.setEmail('gabriel.godoybz@hotmail.com'));
    await widgetTester.runAsync(() async => controller.forgotPasswordUser());
    await widgetTester.pump();

    expect(find.text(S.current.requestErrorMessage('', 'message')),
        findsOneWidget);
  });
}
