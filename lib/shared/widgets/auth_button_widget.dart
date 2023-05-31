import 'package:flutter/material.dart';
import '../themes/app_text_styles.dart';

class AuthButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  const AuthButtonWidget({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Align(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
          child: Text(
            title,
            style: AppTextStyles.displayMedium,
          ),
        ),
      ),
    );
  }
}
