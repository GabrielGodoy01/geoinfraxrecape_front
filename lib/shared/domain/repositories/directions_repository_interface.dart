import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../helpers/errors/errors.dart';
import '../entities/direction.dart';

abstract class IDirectionsRepository {
  Future<Either<Failure, Direction>> getDirection(
      {required LatLng origin, required LatLng destination});
}
