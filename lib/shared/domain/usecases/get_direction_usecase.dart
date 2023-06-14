import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../app/modules/procedure/more-info/presenter/directions_model.dart';
import '../../helpers/errors/errors.dart';
import '../repositories/directions_repository_interface.dart';

abstract class IGetDirectionUsecase {
  Future<Either<Failure, Directions>> call(
      {required LatLng origin, required LatLng destination});
}

class GetDirectionUsecase extends IGetDirectionUsecase {
  final IDirectionsRepository repository;

  GetDirectionUsecase(this.repository);

  @override
  Future<Either<Failure, Directions>> call(
      {required LatLng origin, required LatLng destination}) async {
    return await repository.getDirection(
        origin: origin, destination: destination);
  }
}
