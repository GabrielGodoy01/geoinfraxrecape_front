import 'dart:ui';

import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/datasource/external/http/procedure_datasource.dart';
import 'package:clean_flutter_template/shared/helpers/services/http_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'procedure_datasource_test.mocks.dart';

@GenerateMocks([HttpService])
void main() {
  late ProcedureDatasource datasource;
  HttpService httpRequest = MockHttpService();

  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
    datasource = ProcedureDatasource(httpRequest);
  });

  group('[TEST] - getAllProcedures', () {
    test('success 200', () async {
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
      final response = Response(
          data: listProcedures,
          statusCode: 200,
          requestOptions: RequestOptions());

      when(httpRequest.get(
        '/get-all-procedures',
      )).thenAnswer((_) async => response);

      final result = await datasource.getAllProcedures();

      expect(result.length, 1);
    });

    test('failure', () async {
      final response =
          Response(statusCode: 500, requestOptions: RequestOptions());

      when(httpRequest.get(
        '/get-all-procedures',
      )).thenAnswer((_) async => response);

      expect(() => datasource.getAllProcedures(), throwsException);
    });
  });
}
