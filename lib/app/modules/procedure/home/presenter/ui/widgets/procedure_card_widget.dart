import 'package:clean_flutter_template/shared/domain/entities/procedure.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'info_text_widget.dart';

class ProcedureCardWidget extends StatelessWidget {
  final Procedure procedure;
  const ProcedureCardWidget({super.key, required this.procedure});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          info: DateFormat('dd/MM/yyyy')
                              .format(procedure.dataTermReal),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    InfoTextWidget(
                      title: 'VIA',
                      info: procedure.via,
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 38,
                )),
          ],
        ),
      ),
    );
  }
}
