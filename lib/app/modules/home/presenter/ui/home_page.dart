import 'package:clean_flutter_template/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/themes/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.black,
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Text(
              'Parabéns, você está logado no sistema!',
              textAlign: TextAlign.justify,
              style: AppTextStyles.displayMedium.copyWith(
                  color: AppColors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ));
  }
}
