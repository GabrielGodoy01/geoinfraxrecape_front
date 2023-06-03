import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../shared/helpers/utils/screen_helper.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../shared/widgets/auth_button_widget.dart';
import '../../../../../../shared/widgets/text_field_custom_widget.dart';
import '../controller/confirm_new_password_controller.dart';

class ConfirmNewPasswordPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final String email;
  final String password;
  ConfirmNewPasswordPage(
      {super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    var newPasswordController = Modular.get<ConfirmNewPasswordController>();
    return Scaffold(
        body: Center(
      child: SizedBox(
        width: ScreenHelper.width(context) < ScreenHelper.breakpointTablet
            ? ScreenHelper.width(context)
            : ScreenHelper.breakpointTablet,
        child: Observer(builder: (_) {
          return Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: ScreenHelper.width(context) <
                              ScreenHelper.breakpointTablet
                          ? ScreenHelper.width(context)
                          : 500,
                      height: ScreenHelper.width(context) <
                              ScreenHelper.breakpointTablet
                          ? 180
                          : 280,
                      child: const Image(
                          image: AssetImage('assets/images/gaia_logo.png'),
                          fit: BoxFit.fill),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Text(
                        S.of(context).changePasswordInstructions,
                        textAlign: TextAlign.justify,
                        style: AppTextStyles.displayMedium.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    TextFieldCustomWidget(
                      hintText: S.current.fieldPassword,
                      onChanged: newPasswordController.setPassword,
                      validator: newPasswordController.validatePassword,
                      isPassword: true,
                      showText: newPasswordController.isPasswordVisible,
                      onToggleVisibilityPwd:
                          newPasswordController.changePasswordVisibility,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AuthButtonWidget(
                        title: S.of(context).sendTitle,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            newPasswordController.loginWithNewPassword(
                                email, password);
                          }
                        }),
                  ]));
        }),
      ),
    ));
  }
}
