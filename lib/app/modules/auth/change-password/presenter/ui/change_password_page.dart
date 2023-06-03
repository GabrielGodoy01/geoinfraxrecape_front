import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../shared/helpers/errors/auth_errors.dart';
import '../../../../../../shared/helpers/utils/screen_helper.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../shared/widgets/auth_button_widget.dart';
import '../../../../../../shared/widgets/text_field_custom_widget.dart';
import '../controllers/change_password_controller.dart';
import '../states/change_password_state.dart';

class ChangePasswordPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final String email;
  ChangePasswordPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    var changeController = Modular.get<ChangePasswordController>();
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: ScreenHelper.width(context) < ScreenHelper.breakpointTablet
              ? ScreenHelper.width(context)
              : ScreenHelper.breakpointTablet,
          child: Observer(
            builder: (context) {
              var state = changeController.state;
              return Form(
                  child: Column(
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
                  state is ChangePasswordErrorState
                      ? _buildError(state.error)
                      : const SizedBox(
                          height: 24,
                        ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Text(
                      S.of(context).changePasswordInstructions,
                      textAlign: TextAlign.justify,
                      style: AppTextStyles.displayMedium.copyWith(
                          color: AppColors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                  TextFieldCustomWidget(
                    hintText: S.current.fieldPassword,
                    onChanged: changeController.setNewPassword,
                    validator: changeController.validatePassword,
                    isPassword: true,
                    showText: changeController.isPasswordVisible,
                    onToggleVisibilityPwd:
                        changeController.changePasswordVisibility,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFieldCustomWidget(
                    hintText: S.current.fieldConfirmPassword,
                    onChanged: changeController.setConfirmNewPassword,
                    validator: changeController.validateConfirmPassword,
                    isPassword: true,
                    showText: changeController.isConfirmPasswordVisible,
                    onToggleVisibilityPwd:
                        changeController.changeConfirmPasswordVisibility,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFieldCustomWidget(
                    hintText: S.current.fieldCode,
                    onChanged: changeController.setCode,
                    validator: changeController.validateCode,
                  ),
                  AuthButtonWidget(
                      title: S.of(context).sendTitle,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          changeController.changePassword(email);
                        }
                      }),
                ],
              ));
            },
          ),
        ),
      ),
    );
  }

  Widget _buildError(AuthErrors error) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: Container(
            decoration: BoxDecoration(
              color: AppColors.alertRedColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                S.current.requestErrorMessage('', error.message),
                style:
                    AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
                textAlign: TextAlign.center,
              ),
            )),
      ),
    );
  }
}
