import 'dart:ui';

import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/entities/direction.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:clean_flutter_template/shared/infra/external/http/directions_datasource_interface.dart';
import 'package:clean_flutter_template/shared/infra/repositories/directions_repository_http.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'directions_repository_http_test.mocks.dart';

@GenerateMocks([IDirectionsDatasource])
void main() {
  late DirectionsRepositoryHttp repository;
  IDirectionsDatasource datasource = MockIDirectionsDatasource();

  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - getDirection', () {
    repository = DirectionsRepositoryHttp(datasource);
    var origin = const LatLng(0, 0);
    var destination = const LatLng(0, 0);
    var directions = Direction(
      bounds: LatLngBounds(
        northeast: const LatLng(0, 0),
        southwest: const LatLng(0, 0),
      ),
      polylinePoints: [],
      totalDistance: '',
      totalDuration: '',
    );
    test('should return a Direction', () async {
      when(datasource.getDirection(origin: origin, destination: destination))
          .thenAnswer((_) async => directions);
      var response = await repository.getDirection(
          origin: origin, destination: destination);
      expect(response.fold(id, id), isA<Direction>());
    });

    test('should return ErrorRequest', () async {
      when(datasource.getDirection(origin: origin, destination: destination))
          .thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 400,
          data: {'message': 'message'},
        ),
      ));
      var response = await repository.getDirection(
          origin: origin, destination: destination);
      expect(response.fold(id, id), isA<ErrorRequest>());
    });
  });
}
