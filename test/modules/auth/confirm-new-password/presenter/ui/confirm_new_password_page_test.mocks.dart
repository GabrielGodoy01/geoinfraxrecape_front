// Mocks generated by Mockito 5.4.0 from annotations
// in clean_flutter_template/test/modules/auth/confirm-new-password/presenter/ui/confirm_new_password_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart' as _i6;
import 'package:clean_flutter_template/shared/domain/usecases/login_with_new_password_usecase.dart'
    as _i3;
import 'package:clean_flutter_template/shared/helpers/errors/auth_errors.dart'
    as _i5;
import 'package:dartz/dartz.dart' as _i2;
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

/// A class which mocks [ILoginWithNewPasswordUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockILoginWithNewPasswordUsecase extends _i1.Mock
    implements _i3.ILoginWithNewPasswordUsecase {
  MockILoginWithNewPasswordUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.AuthErrors, _i6.SignInResult>> call(
    String? email,
    String? password,
    String? newPassword,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [
            email,
            password,
            newPassword,
          ],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.AuthErrors, _i6.SignInResult>>.value(
                _FakeEither_0<_i5.AuthErrors, _i6.SignInResult>(
          this,
          Invocation.method(
            #call,
            [
              email,
              password,
              newPassword,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.AuthErrors, _i6.SignInResult>>);
}
