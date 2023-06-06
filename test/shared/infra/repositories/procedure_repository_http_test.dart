import 'dart:ui';

import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/entities/procedure.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:clean_flutter_template/shared/infra/external/http/procedure_datasource_interface.dart';
import 'package:clean_flutter_template/shared/infra/repositories/procedure_repository_http.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'procedure_repository_http_test.mocks.dart';

@GenerateMocks([IProcedureDatasource])
void main() {
  late ProcedureRepositoryHttp repository;
  IProcedureDatasource datasource = MockIProcedureDatasource();

  var listProcedures = <Procedure>[
    Procedure(
      protcod: '',
      nomePermissionariaCompleto: '',
      nomePermissionaria: '',
      lat: '',
      long: '',
      dataTermReal: DateTime.now(),
    ),
    Procedure(
      protcod: '',
      nomePermissionariaCompleto: '',
      nomePermissionaria: '',
      lat: '',
      long: '',
      dataTermReal: DateTime.now(),
    ),
    Procedure(
      protcod: '',
      nomePermissionariaCompleto: '',
      nomePermissionaria: '',
      lat: '',
      long: '',
      dataTermReal: DateTime.now(),
    )
  ];

  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - getAllProcedures', () {
    repository = ProcedureRepositoryHttp(datasource);
    test('should return a List<Procedure>', () async {
      when(datasource.getAllProcedures())
          .thenAnswer((_) async => listProcedures);
      var response = await repository.getAllProcedures();
      expect(response.fold(id, id), isA<List<Procedure>>());
    });

    test('should return ErrorRequest', () async {
      when(datasource.getAllProcedures()).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 400,
          data: {'message': 'message'},
        ),
      ));
      var response = await repository.getAllProcedures();
      expect(response.fold(id, id), isA<ErrorRequest>());
    });
  });
}
