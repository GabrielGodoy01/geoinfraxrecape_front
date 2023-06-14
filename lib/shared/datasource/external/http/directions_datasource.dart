import 'package:clean_flutter_template/shared/domain/entities/direction.dart';
import 'package:clean_flutter_template/shared/infra/external/http/directions_datasource_interface.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';

import '../../../helpers/services/http_service.dart';
import '../../../infra/models/direction_model.dart';

class DirectionsDatasource extends IDirectionsDatasource {
  final HttpService _httpService;

  DirectionsDatasource(this._httpService);

  @override
  Future<Direction> getDirection(
      {required LatLng origin, required LatLng destination}) async {
    final response = await _httpService.get('baseUrl', data: {
      'origin': '${origin.latitude},${origin.longitude}',
      'destination': '${destination.latitude},${destination.longitude}',
      'key': 'AIzaSyBiEm6Y6LChYQ6JsG7-b8yARxjjco9acYM',
    });

    if (response.statusCode == 200) {
      return DirectionModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }
}
