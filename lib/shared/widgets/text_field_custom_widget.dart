import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';

class TextFieldCustomWidget extends StatelessWidget {
  final String? title;
  final TextInputType? keyboardType;
  final Iterable<String>? autoFillHints;
  final String? hintText;
  final bool isPassword;
  final bool showText;
  final void Function()? onToggleVisibilityPwd;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldCustomWidget({
    super.key,
    this.title,
    this.keyboardType,
    this.autoFillHints,
    this.hintText,
    this.inputFormatters,
    this.onChanged,
    this.validator,
    this.isPassword = false,
    this.onToggleVisibilityPwd,
    this.showText = false,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null
              ? Text(
                  title!,
                  style: AppTextStyles.displaySmall,
                )
              : const SizedBox.shrink(),
          TextFormField(
            inputFormatters: inputFormatters,
            textAlign: TextAlign.start,
            onChanged: onChanged,
            validator: validator,
            keyboardType: keyboardType ?? TextInputType.emailAddress,
            autofillHints: autoFillHints ??
                const [
                  AutofillHints.email,
                ],
            cursorColor: AppColors.black,
            style: Theme.of(context).textTheme.displaySmall,
            obscureText: showText,
            decoration: InputDecoration(
                suffixIcon: isPassword
                    ? InkWell(
                        onTap: () => onToggleVisibilityPwd!(),
                        child: Icon(
                          showText ? Icons.visibility : Icons.visibility_off,
                          color: AppColors.black,
                          size: 20,
                        ),
                      )
                    : null,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                hintText: hintText,
                suffixIconColor: Theme.of(context).colorScheme.primary,
                border: const OutlineInputBorder(),
                fillColor: AppColors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1))),
          ),
        ],
      ),
    );
  }
}
