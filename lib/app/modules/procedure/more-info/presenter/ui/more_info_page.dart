import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MoreInfoPage extends StatelessWidget {
  const MoreInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(-23.533773, -46.625290),
          zoom: 11.5,
        ),
        polylines: {
          Polyline(
            polylineId: PolylineId('1'),
            width: 1,
            points: [
              LatLng(-23.533773, -46.625290),
              LatLng(-23.533773, -47.625290),
            ],
          )
        },
        markers: {
          Marker(
            markerId: const MarkerId('1'),
            position: const LatLng(-23.533773, -46.625290),
            infoWindow: const InfoWindow(title: 'Marker 1'),
          ),
        },
      ),
    );
  }
}
