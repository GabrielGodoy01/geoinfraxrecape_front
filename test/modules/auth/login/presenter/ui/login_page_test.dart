import 'package:clean_flutter_template/app/modules/auth/auth_module.dart';
import 'package:clean_flutter_template/app/modules/auth/login/presenter/controller/login_controller.dart';
import 'package:clean_flutter_template/app/modules/auth/login/presenter/pages/login_page.dart';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/usecases/get_user_attributes_usecase.dart';
import 'package:clean_flutter_template/shared/domain/usecases/login_user_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/auth_errors.dart';
import 'package:clean_flutter_template/shared/widgets/auth_button_widget.dart';
import 'package:clean_flutter_template/shared/widgets/text_field_custom_widget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import 'login_page_test.mocks.dart';

@GenerateMocks([ILoginUserUsecase, IGetUserAttributesUsecase])
void main() {
  late LoginController controller;
  ILoginUserUsecase usecase = MockILoginUserUsecase();
  IGetUserAttributesUsecase usecase2 = MockIGetUserAttributesUsecase();

  setUp(() async {
    initModules([
      AuthModule()
    ], replaceBinds: [
      modular.Bind<ILoginUserUsecase>((i) => usecase),
      modular.Bind<IGetUserAttributesUsecase>((i) => usecase2),
    ]);
    controller = Modular.get<LoginController>();
    usecase = Modular.get<ILoginUserUsecase>();
    usecase2 = Modular.get<IGetUserAttributesUsecase>();
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  testWidgets('[TEST] - GetUserPage must show some widgets when initialize',
      (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ], supportedLocales: S.delegate.supportedLocales, home: LoginPage()));
    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(AuthButtonWidget), findsNWidgets(2));
    expect(find.byType(TextFieldCustomWidget), findsNWidgets(2));
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('[TEST] - GetUserPage must show ErrorWidget when create user',
      (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ], supportedLocales: S.delegate.supportedLocales, home: LoginPage()));
    when(usecase.call('gabriel.godoybz@hotmail.com', 'Teste123!'))
        .thenAnswer((_) async => left(AuthErrors(message: 'message')));
    when(usecase2.call())
        .thenAnswer((_) async => left(AuthErrors(message: 'message')));
    await widgetTester.runAsync(
        () async => controller.setEmail('gabriel.godoybz@hotmail.com'));

    await widgetTester
        .runAsync(() async => controller.setPassword('Teste123!'));
    await widgetTester.runAsync(() async => controller.loginWithEmail());
    await widgetTester.pump();

    expect(find.text(S.current.requestErrorMessage('', 'message')),
        findsOneWidget);
  });
}
