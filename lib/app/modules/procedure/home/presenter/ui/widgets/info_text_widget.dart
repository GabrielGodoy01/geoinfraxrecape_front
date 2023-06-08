import 'package:clean_flutter_template/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class InfoTextWidget extends StatelessWidget {
  final String title;
  final String info;
  const InfoTextWidget({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.grey,
                )),
        Text(
          info,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
