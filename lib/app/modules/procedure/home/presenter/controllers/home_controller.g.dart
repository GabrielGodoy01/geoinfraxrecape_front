// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$allProceduresAtom =
      Atom(name: 'HomeControllerBase.allProcedures', context: context);

  @override
  List<Procedure> get allProcedures {
    _$allProceduresAtom.reportRead();
    return super.allProcedures;
  }

  @override
  set allProcedures(List<Procedure> value) {
    _$allProceduresAtom.reportWrite(value, super.allProcedures, () {
      super.allProcedures = value;
    });
  }

  late final _$stateAtom =
      Atom(name: 'HomeControllerBase.state', context: context);

  @override
  HomeState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(HomeState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$codeFilterAtom =
      Atom(name: 'HomeControllerBase.codeFilter', context: context);

  @override
  String get codeFilter {
    _$codeFilterAtom.reportRead();
    return super.codeFilter;
  }

  @override
  set codeFilter(String value) {
    _$codeFilterAtom.reportWrite(value, super.codeFilter, () {
      super.codeFilter = value;
    });
  }

  late final _$getAllProceduresAsyncAction =
      AsyncAction('HomeControllerBase.getAllProcedures', context: context);

  @override
  Future<void> getAllProcedures() {
    return _$getAllProceduresAsyncAction.run(() => super.getAllProcedures());
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  void changeState(HomeState value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.changeState');
    try {
      return super.changeState(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCodeFilter(String value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setCodeFilter');
    try {
      return super.setCodeFilter(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterByCode(String value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.filterByCode');
    try {
      return super.filterByCode(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allProcedures: ${allProcedures},
state: ${state},
codeFilter: ${codeFilter}
    ''';
  }
}
