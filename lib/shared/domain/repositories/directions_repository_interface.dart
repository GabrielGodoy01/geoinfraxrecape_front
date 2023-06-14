import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../app/modules/procedure/more-info/presenter/directions_model.dart';
import '../../helpers/errors/errors.dart';

abstract class IDirectionsRepository {
  Future<Either<Failure, Directions>> getDirection(
      {required LatLng origin, required LatLng destination});
}
