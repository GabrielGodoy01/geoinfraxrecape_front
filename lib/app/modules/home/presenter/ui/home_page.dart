import 'package:clean_flutter_template/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.black,
        body: const Center(
          child: Text('Parabéns você está logado!'),
        ));
  }
}
