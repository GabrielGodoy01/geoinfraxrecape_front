import 'package:clean_flutter_template/app/modules/procedure/more-info/presenter/directions_model.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionsRepository {
  static const String baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio = Dio();

  DirectionsRepository();

  Future<Directions?> getDirection(
      {required LatLng origin, required LatLng destination}) async {
    final response = await _dio.get(baseUrl, queryParameters: {
      'origin': '${origin.latitude},${origin.longitude}',
      'destination': '${destination.latitude},${destination.longitude}',
      'key': 'AIzaSyBiEm6Y6LChYQ6JsG7-b8yARxjjco9acYM',
    });

    if (response.statusCode == 200) {
      return Directions.fromMap(response.data);
    }
    return null;
  }
}
