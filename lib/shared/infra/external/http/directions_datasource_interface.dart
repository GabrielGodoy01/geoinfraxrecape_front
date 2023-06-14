import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../domain/entities/direction.dart';

abstract class IDirectionsDatasource {
  Future<Direction> getDirection(
      {required LatLng origin, required LatLng destination});
}
