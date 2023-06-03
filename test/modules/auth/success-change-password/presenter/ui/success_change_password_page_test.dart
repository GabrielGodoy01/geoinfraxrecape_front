import 'package:clean_flutter_template/app/modules/auth/success-change-password/presenter/ui/success_change_password_page.dart';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/widgets/auth_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  testWidgets(
      '[TEST] - SuccessChangePasswordPage must show some widgets when initialize',
      (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const SuccessChangePasswordPage()));
    expect(find.byType(AuthButtonWidget), findsOneWidget);
    expect(find.text(S.current.successChangePasswordTitle), findsOneWidget);
  });
}
