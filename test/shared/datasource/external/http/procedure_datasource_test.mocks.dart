// Mocks generated by Mockito 5.4.0 from annotations
// in clean_flutter_template/test/shared/datasource/external/http/procedure_datasource_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:clean_flutter_template/shared/helpers/enums/token_enum.dart'
    as _i6;
import 'package:clean_flutter_template/shared/helpers/services/http_request_interface.dart'
    as _i2;
import 'package:clean_flutter_template/shared/helpers/services/http_service.dart'
    as _i4;
import 'package:dio/dio.dart' as _i3;
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

class _FakeIHttpRequest_0 extends _i1.SmartFake implements _i2.IHttpRequest {
  _FakeIHttpRequest_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_1<T> extends _i1.SmartFake implements _i3.Response<T> {
  _FakeResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HttpService].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpService extends _i1.Mock implements _i4.HttpService {
  MockHttpService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IHttpRequest get httpRequest => (super.noSuchMethod(
        Invocation.getter(#httpRequest),
        returnValue: _FakeIHttpRequest_0(
          this,
          Invocation.getter(#httpRequest),
        ),
      ) as _i2.IHttpRequest);
  @override
  _i5.Future<_i3.Response<dynamic>> get(
    String? url, {
    dynamic data,
    _i6.TokenEnum? tokenType = _i6.TokenEnum.NOTOKEN,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {
            #data: data,
            #tokenType: tokenType,
          },
        ),
        returnValue:
            _i5.Future<_i3.Response<dynamic>>.value(_FakeResponse_1<dynamic>(
          this,
          Invocation.method(
            #get,
            [url],
            {
              #data: data,
              #tokenType: tokenType,
            },
          ),
        )),
      ) as _i5.Future<_i3.Response<dynamic>>);
  @override
  _i5.Future<_i3.Response<dynamic>> post(
    String? url, {
    dynamic data,
    _i6.TokenEnum? tokenType = _i6.TokenEnum.NOTOKEN,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #data: data,
            #tokenType: tokenType,
          },
        ),
        returnValue:
            _i5.Future<_i3.Response<dynamic>>.value(_FakeResponse_1<dynamic>(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #data: data,
              #tokenType: tokenType,
            },
          ),
        )),
      ) as _i5.Future<_i3.Response<dynamic>>);
  @override
  _i5.Future<_i3.Response<dynamic>> put(
    String? url, {
    dynamic data,
    _i6.TokenEnum? tokenType = _i6.TokenEnum.NOTOKEN,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #data: data,
            #tokenType: tokenType,
          },
        ),
        returnValue:
            _i5.Future<_i3.Response<dynamic>>.value(_FakeResponse_1<dynamic>(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #data: data,
              #tokenType: tokenType,
            },
          ),
        )),
      ) as _i5.Future<_i3.Response<dynamic>>);
}
