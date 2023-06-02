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
import '../controllers/forgot_password_controller.dart';
import '../states/forgot_password_state.dart';

class ForgotPasswordPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    var forgotController = Modular.get<ForgotPasswordController>();
    return Scaffold(
        backgroundColor: AppColors.black,
        body: Center(
          child: SizedBox(
              width: ScreenHelper.width(context) < ScreenHelper.breakpointTablet
                  ? ScreenHelper.width(context)
                  : ScreenHelper.breakpointTablet,
              child: Observer(builder: (_) {
                var state = forgotController.state;
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
                      state is ForgotPasswordErrorState
                          ? _buildError(state.error)
                          : const SizedBox(
                              height: 24,
                            ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: Text(
                          S.of(context).forgotPasswordInstructions,
                          textAlign: TextAlign.justify,
                          style: AppTextStyles.displayMedium.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFieldCustomWidget(
                        hintText: S.current.fieldEmail,
                        onChanged: forgotController.setEmail,
                        validator: forgotController.validateEmail,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      AuthButtonWidget(
                          title: S.of(context).sendTitle,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              forgotController.forgotPasswordUser();
                            }
                          }),
                    ],
                  ),
                );
              })),
        ));
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
