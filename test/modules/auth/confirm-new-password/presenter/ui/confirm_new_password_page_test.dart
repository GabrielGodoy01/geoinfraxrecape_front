import 'package:clean_flutter_template/app/modules/auth/auth_module.dart';
import 'package:clean_flutter_template/app/modules/auth/confirm-new-password/presenter/controller/confirm_new_password_controller.dart';
import 'package:clean_flutter_template/app/modules/auth/confirm-new-password/presenter/ui/confirm_new_password_page.dart';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/usecases/login_with_new_password_usecase.dart';
import 'package:clean_flutter_template/shared/widgets/auth_button_widget.dart';
import 'package:clean_flutter_template/shared/widgets/text_field_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;
import 'package:mockito/annotations.dart';
import 'package:modular_test/modular_test.dart';

import 'confirm_new_password_page_test.mocks.dart';

@GenerateMocks([
  ILoginWithNewPasswordUsecase,
])
void main() {
  // ignore: unused_local_variable
  late ConfirmNewPasswordController controller;
  ILoginWithNewPasswordUsecase usecase = MockILoginWithNewPasswordUsecase();

  setUp(() async {
    initModules([
      AuthModule()
    ], replaceBinds: [
      modular.Bind<ILoginWithNewPasswordUsecase>((i) => usecase),
    ]);
    controller = Modular.get<ConfirmNewPasswordController>();
    usecase = Modular.get<ILoginWithNewPasswordUsecase>();
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  testWidgets(
      '[TEST] - ConfirmNewPasswordPage must show some widgets when initialize',
      (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: ConfirmNewPasswordPage(email: '', password: '')));
    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(AuthButtonWidget), findsOneWidget);
    expect(find.byType(TextFieldCustomWidget), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}
