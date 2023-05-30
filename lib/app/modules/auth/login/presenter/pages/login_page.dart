import 'package:clean_flutter_template/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../shared/widgets/text_field_custom_widget.dart';
import '../controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<LoginController>();
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          TextFieldCustomWidget(
            hintText: S.current.fieldEmail,
            onChanged: controller.setEmail,
            validator: controller.validateEmail,
          ),
          TextFieldCustomWidget(
            hintText: S.current.fieldPassword,
            onChanged: controller.setPassword,
            validator: controller.validatePassword,
          ),
        ],
      ),
    );
  }
}
