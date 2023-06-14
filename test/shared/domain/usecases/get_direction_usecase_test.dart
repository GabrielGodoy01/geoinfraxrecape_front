import 'package:clean_flutter_template/shared/domain/entities/direction.dart';
import 'package:clean_flutter_template/shared/domain/repositories/directions_repository_interface.dart';
import 'package:clean_flutter_template/shared/domain/usecases/get_direction_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_direction_usecase_test.mocks.dart';

@GenerateMocks([IDirectionsRepository])
void main() {
  late IGetDirectionUsecase usecase;
  IDirectionsRepository repository = MockIDirectionsRepository();

  setUp(() {
    usecase = GetDirectionUsecase(repository);
  });

  group('[TEST] - getDirections', () {
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
    test('should return Directions', () async {
      when(repository.getDirection(origin: origin, destination: destination))
          .thenAnswer((_) async => Right(directions));
      var result = await usecase(origin: origin, destination: destination);
      expect(result.fold((l) => l, (r) => r), isA<Direction>());
    });

    test('should return Failure', () async {
      when(repository.getDirection(origin: origin, destination: destination))
          .thenAnswer((_) async => Left(Failure(message: '')));
      final result = await usecase(origin: origin, destination: destination);
      expect(result.fold((l) => l, (r) => r), isA<Failure>());
    });
  });
}
