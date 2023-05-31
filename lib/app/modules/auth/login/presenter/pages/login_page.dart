import 'package:clean_flutter_template/shared/helpers/errors/auth_errors.dart';
import 'package:clean_flutter_template/shared/themes/app_colors.dart';
import 'package:clean_flutter_template/shared/themes/app_text_styles.dart';
import 'package:clean_flutter_template/shared/widgets/auth_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../shared/helpers/utils/screen_helper.dart';
import '../../../../../../shared/widgets/text_field_custom_widget.dart';
import '../controller/login_controller.dart';
import '../states/login_state.dart';

class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var loginController = Modular.get<LoginController>();
    return Scaffold(
        backgroundColor: AppColors.black,
        body: Observer(builder: (_) {
          var state = loginController.state;

          return Stack(
            children: [
              Positioned(
                top: 50,
                left:
                    ScreenHelper.width(context) < ScreenHelper.breakpointTablet
                        ? 0
                        : ScreenHelper.width(context) / 2 - 250,
                child: SizedBox(
                  width: ScreenHelper.width(context) <
                          ScreenHelper.breakpointTablet
                      ? ScreenHelper.width(context)
                      : 500,
                  height: ScreenHelper.width(context) <
                          ScreenHelper.breakpointTablet
                      ? 180
                      : 300,
                  child: const Image(
                      image: AssetImage('assets/images/gaia_logo.png'),
                      fit: BoxFit.fill),
                ),
              ),
              Center(
                child: SizedBox(
                  width: ScreenHelper.width(context) <
                          ScreenHelper.breakpointTablet
                      ? ScreenHelper.width(context)
                      : ScreenHelper.breakpointTablet,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        state is LoginErrorState
                            ? _buildError(state.error)
                            : const SizedBox(
                                height: 24,
                              ),
                        TextFieldCustomWidget(
                          hintText: S.current.fieldEmail,
                          onChanged: loginController.setEmail,
                          validator: loginController.validateEmail,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFieldCustomWidget(
                          hintText: S.current.fieldPassword,
                          onChanged: loginController.setPassword,
                          validator: loginController.validatePassword,
                          isPassword: true,
                          showText: loginController.isPasswordVisible,
                          onToggleVisibilityPwd:
                              loginController.changePasswordState,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        AuthButtonWidget(
                            title: S.of(context).enterTitle,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                loginController.loginWithEmail();
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }));
  }

  Widget _buildError(AuthErrors error) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                style: AppTextStyles.bodyMedium,
                textAlign: TextAlign.center,
              ),
            )),
      ),
    );
  }
}
