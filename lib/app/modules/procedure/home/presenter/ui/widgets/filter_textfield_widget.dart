import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../../shared/themes/app_colors.dart';

class FilterTextfieldWidget extends StatelessWidget {
  final String? hintText;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  const FilterTextfieldWidget(
      {super.key,
      this.hintText,
      this.onChanged,
      this.inputFormatters,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      textAlign: TextAlign.start,
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      cursorColor: AppColors.black,
      style: Theme.of(context).textTheme.displaySmall,
      decoration: InputDecoration(
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
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColor, width: 1))),
    );
  }
}
