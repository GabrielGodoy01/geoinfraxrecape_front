import 'dart:ui';

import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/entities/procedure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  test('[TEST] - procedure is valid', () {
    expect(
      () => Procedure(
        protcod: '',
        lat: '',
        long: '',
        dataTermReal: DateTime.now(),
        nomePermissionaria: '',
        nomePermissionariaCompleto: '',
      ),
      isNotNull,
    );
  });
}
