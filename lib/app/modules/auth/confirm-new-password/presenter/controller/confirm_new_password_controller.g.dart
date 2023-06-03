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

  late final _$passwordAtom =
      Atom(name: 'ConfirmNewPasswordControllerBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$changePasswordAsyncAction = AsyncAction(
      'ConfirmNewPasswordControllerBase.changePassword',
      context: context);

  @override
  Future<void> changePassword(String email) {
    return _$changePasswordAsyncAction.run(() => super.changePassword(email));
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
password: ${password}
    ''';
  }
}
