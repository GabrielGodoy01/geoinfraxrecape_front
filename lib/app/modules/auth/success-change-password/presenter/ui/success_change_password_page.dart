import 'package:clean_flutter_template/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../shared/widgets/auth_button_widget.dart';

class SuccessChangePasswordPage extends StatelessWidget {
  const SuccessChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Column(
          children: [
            Text(S.of(context).successChangePasswordTitle),
            const SizedBox(
              height: 32,
            ),
            AuthButtonWidget(
                title: S.of(context).loginTitle,
                onPressed: () {
                  Modular.to.navigate('/login');
                }),
          ],
        ),
      ),
    );
  }
}
