import 'dart:ui';

import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/infra/models/procedure_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final procedure = {
    'protcod': '123',
    'nomePermissionariaCompleto': 'John Doe',
    'nomePermissionaria': 'johndoe@example.com',
    'lat': 'APPROVED',
    'long': 'APPROVED',
    'dataTermReal': DateTime.now()
  };
  final listProcedures = [
    {
      'protcod': '123',
      'nomePermissionariaCompleto': 'John Doe',
      'nomePermissionaria': 'johndoe@example.com',
      'lat': 'APPROVED',
      'long': 'APPROVED',
      'dataTermReal': DateTime.now()
    }
  ];

  setUpAll(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  test('[TEST] - ProcedureModel fromJson', () {
    expect(ProcedureModel.fromJson(procedure).protcod, '123');
    expect(ProcedureModel.fromJson(procedure).lat, 'APPROVED');
  });

  test('[TEST] - ProcedureModel fromMaps', () {
    expect(ProcedureModel.fromMaps(listProcedures).length, 1);
  });
}
