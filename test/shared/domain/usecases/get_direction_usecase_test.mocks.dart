// Mocks generated by Mockito 5.4.0 from annotations
// in clean_flutter_template/test/shared/domain/usecases/get_direction_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:clean_flutter_template/shared/domain/entities/direction.dart'
    as _i6;
import 'package:clean_flutter_template/shared/domain/repositories/directions_repository_interface.dart'
    as _i3;
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart'
    as _i5;
import 'package:dartz/dartz.dart' as _i2;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IDirectionsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIDirectionsRepository extends _i1.Mock
    implements _i3.IDirectionsRepository {
  MockIDirectionsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Direction>> getDirection({
    required _i7.LatLng? origin,
    required _i7.LatLng? destination,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDirection,
          [],
          {
            #origin: origin,
            #destination: destination,
          },
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Direction>>.value(
            _FakeEither_0<_i5.Failure, _i6.Direction>(
          this,
          Invocation.method(
            #getDirection,
            [],
            {
              #origin: origin,
              #destination: destination,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Direction>>);
}
