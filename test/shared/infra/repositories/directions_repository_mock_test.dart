import 'package:clean_flutter_template/shared/domain/entities/direction.dart';
import 'package:clean_flutter_template/shared/infra/repositories/directions_repository_mock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  DirectionsRepositoryMock repository = DirectionsRepositoryMock();

  group('[TEST] - DirectionsRepositoryMock', () {
    var origin = const LatLng(0, 0);
    var destination = const LatLng(0, 0);
    test('should return Direction', () async {
      var result = await repository.getDirection(
          destination: destination, origin: origin);
      expect(result.fold((l) => l, (r) => r), isA<Direction>());
    });
  });
}
