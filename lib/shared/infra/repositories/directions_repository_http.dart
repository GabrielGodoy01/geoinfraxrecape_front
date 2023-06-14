import 'package:clean_flutter_template/shared/domain/entities/direction.dart';
import 'package:clean_flutter_template/shared/domain/repositories/directions_Repository_interface.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../helpers/enums/http_status_code_enum.dart';
import '../../helpers/functions/get_http_status_function.dart';
import '../external/http/directions_datasource_interface.dart';

class DirectionsRepositoryHttp extends IDirectionsRepository {
  final IDirectionsDatasource datasource;

  DirectionsRepositoryHttp(this.datasource);

  @override
  Future<Either<Failure, Direction>> getDirection(
      {required LatLng origin, required LatLng destination}) async {
    late Direction direction;
    try {
      direction = await datasource.getDirection(
          origin: origin, destination: destination);
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
      //caso erro venha do back
      //return left(ErrorRequest(message: e.response?.data));
    }
    return right(direction);
  }
}
