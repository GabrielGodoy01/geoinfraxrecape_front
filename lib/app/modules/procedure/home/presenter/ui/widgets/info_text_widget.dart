import 'package:flutter/material.dart';

class InfoTextWidget extends StatelessWidget {
  final String title;
  final String info;
  const InfoTextWidget({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          info,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
