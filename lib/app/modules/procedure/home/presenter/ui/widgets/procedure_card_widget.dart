import 'package:clean_flutter_template/shared/domain/entities/procedure.dart';
import 'package:flutter/material.dart';

import 'info_text_widget.dart';

class ProcedureCardWidget extends StatelessWidget {
  final Procedure procedure;
  const ProcedureCardWidget({super.key, required this.procedure});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  InfoTextWidget(
                    title: 'CÓDIGO',
                    info: procedure.protcod,
                  ),
                  InfoTextWidget(
                    title: 'PERMISSIONÁRIA',
                    info: procedure.nomePermissionaria,
                  ),
                  InfoTextWidget(
                    title: 'DATA',
                    info: procedure.dataTermReal.toString(),
                  ),
                ],
              ),
              InfoTextWidget(
                title: 'VIA',
                info: procedure.via,
              ),
            ],
          )
        ],
      ),
    );
  }
}
