// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_new_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfirmNewPasswordController
    on ConfirmNewPasswordControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'ConfirmNewPasswordControllerBase.state', context: context);

  @override
  ConfirmNewPasswordState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ConfirmNewPasswordState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$isPasswordVisibleAtom = Atom(
      name: 'ConfirmNewPasswordControllerBase.isPasswordVisible',
      context: context);

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  late final _$newPasswordAtom = Atom(
      name: 'ConfirmNewPasswordControllerBase.newPassword', context: context);

  @override
  String get newPassword {
    _$newPasswordAtom.reportRead();
    return super.newPassword;
  }

  @override
  set newPassword(String value) {
    _$newPasswordAtom.reportWrite(value, super.newPassword, () {
      super.newPassword = value;
    });
  }

  late final _$loginWithNewPasswordAsyncAction = AsyncAction(
      'ConfirmNewPasswordControllerBase.loginWithNewPassword',
      context: context);

  @override
  Future<void> loginWithNewPassword(String email, String password) {
    return _$loginWithNewPasswordAsyncAction
        .run(() => super.loginWithNewPassword(email, password));
  }

  late final _$ConfirmNewPasswordControllerBaseActionController =
      ActionController(
          name: 'ConfirmNewPasswordControllerBase', context: context);

  @override
  void changeState(ConfirmNewPasswordState value) {
    final _$actionInfo = _$ConfirmNewPasswordControllerBaseActionController
        .startAction(name: 'ConfirmNewPasswordControllerBase.changeState');
    try {
      return super.changeState(value);
    } finally {
      _$ConfirmNewPasswordControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changePasswordVisibility() {
    final _$actionInfo =
        _$ConfirmNewPasswordControllerBaseActionController.startAction(
            name: 'ConfirmNewPasswordControllerBase.changePasswordVisibility');
    try {
      return super.changePasswordVisibility();
    } finally {
      _$ConfirmNewPasswordControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$ConfirmNewPasswordControllerBaseActionController
        .startAction(name: 'ConfirmNewPasswordControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$ConfirmNewPasswordControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String? validatePassword(String? value) {
    final _$actionInfo = _$ConfirmNewPasswordControllerBaseActionController
        .startAction(name: 'ConfirmNewPasswordControllerBase.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$ConfirmNewPasswordControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
isPasswordVisible: ${isPasswordVisible},
newPassword: ${newPassword}
    ''';
  }
}
