import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';

class TextFieldCustomWidget extends StatelessWidget {
  final String? title;
  final TextInputType? keyboardType;
  final Iterable<String>? autoFillHints;
  final String? hintText;
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
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              hintText: hintText,
              suffixIconColor: Theme.of(context).colorScheme.primary,
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 2))),
        ),
      ],
    );
  }
}
