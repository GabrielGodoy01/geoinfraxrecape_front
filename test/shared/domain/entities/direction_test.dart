import 'dart:ui';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/entities/direction.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  test('[TEST] - Directions is valid', () {
    expect(
      () => Direction(
        bounds: LatLngBounds(
            northeast: const LatLng(0, 0), southwest: const LatLng(0, 0)),
        polylinePoints: [],
        totalDistance: '',
        totalDuration: '',
      ),
      isNotNull,
    );
  });
}
