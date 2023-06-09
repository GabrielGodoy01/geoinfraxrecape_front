import 'package:clean_flutter_template/app/modules/auth/auth_module.dart';
import 'package:clean_flutter_template/app/modules/auth/change-password/presenter/controllers/change_password_controller.dart';
import 'package:clean_flutter_template/app/modules/auth/change-password/presenter/ui/change_password_page.dart';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/usecases/change_password_usecase.dart';
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

import 'change_password_page_test.mocks.dart';

@GenerateMocks([IChangePasswordUsecase])
void main() {
  late ChangePasswordController controller;
  IChangePasswordUsecase usecase = MockIChangePasswordUsecase();

  setUp(() async {
    initModules([
      AuthModule()
    ], replaceBinds: [
      modular.Bind<IChangePasswordUsecase>((i) => usecase),
    ]);
    controller = Modular.get<ChangePasswordController>();
    usecase = Modular.get<IChangePasswordUsecase>();
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  testWidgets(
      '[TEST] - ChangePasswordPage must show some widgets when initialize',
      (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: ChangePasswordPage(email: '')));
    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(AuthButtonWidget), findsOneWidget);
    expect(find.byType(TextFieldCustomWidget), findsNWidgets(3));
    expect(find.text(S.current.changePasswordInstructions), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets(
      '[TEST] - ChangePasswordPage must show ErrorWidget when create user',
      (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: ChangePasswordPage(
          email: '',
        )));
    when(usecase.call('', '', ''))
        .thenAnswer((_) async => left(AuthErrors(message: 'message')));
    await widgetTester.runAsync(() async => controller.setCode(''));
    await widgetTester.runAsync(() async => controller.setNewPassword(''));
    await widgetTester
        .runAsync(() async => controller.setConfirmNewPassword(''));
    await widgetTester.runAsync(() async => controller.changePassword(''));
    await widgetTester.pump();

    expect(find.text(S.current.requestErrorMessage('', 'message')),
        findsOneWidget);
  });
}
