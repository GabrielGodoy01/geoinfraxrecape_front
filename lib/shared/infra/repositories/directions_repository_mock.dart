import 'package:clean_flutter_template/shared/domain/entities/direction.dart';

import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../domain/repositories/directions_Repository_interface.dart';

class DirectionsRepositoryMock extends IDirectionsRepository {
  var direction = Direction(
    bounds: LatLngBounds(
      northeast: const LatLng(0, 0),
      southwest: const LatLng(0, 0),
    ),
    polylinePoints: [],
    totalDistance: '',
    totalDuration: '',
  );

  @override
  Future<Either<Failure, Direction>> getDirection(
      {required LatLng origin, required LatLng destination}) {
    return Future.value(Right(direction));
  }
}
