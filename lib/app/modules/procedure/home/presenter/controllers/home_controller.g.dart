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

  late final _$viaFilterAtom =
      Atom(name: 'HomeControllerBase.viaFilter', context: context);

  @override
  String get viaFilter {
    _$viaFilterAtom.reportRead();
    return super.viaFilter;
  }

  @override
  set viaFilter(String value) {
    _$viaFilterAtom.reportWrite(value, super.viaFilter, () {
      super.viaFilter = value;
    });
  }

  late final _$permissionariaFilterAtom =
      Atom(name: 'HomeControllerBase.permissionariaFilter', context: context);

  @override
  String get permissionariaFilter {
    _$permissionariaFilterAtom.reportRead();
    return super.permissionariaFilter;
  }

  @override
  set permissionariaFilter(String value) {
    _$permissionariaFilterAtom.reportWrite(value, super.permissionariaFilter,
        () {
      super.permissionariaFilter = value;
    });
  }

  late final _$dateFilterAtom =
      Atom(name: 'HomeControllerBase.dateFilter', context: context);

  @override
  String get dateFilter {
    _$dateFilterAtom.reportRead();
    return super.dateFilter;
  }

  @override
  set dateFilter(String value) {
    _$dateFilterAtom.reportWrite(value, super.dateFilter, () {
      super.dateFilter = value;
    });
  }

  late final _$itemCountAtom =
      Atom(name: 'HomeControllerBase.itemCount', context: context);

  @override
  int get itemCount {
    _$itemCountAtom.reportRead();
    return super.itemCount;
  }

  @override
  set itemCount(int value) {
    _$itemCountAtom.reportWrite(value, super.itemCount, () {
      super.itemCount = value;
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
  void setViaFilter(String value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setViaFilter');
    try {
      return super.setViaFilter(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPermissionariaFilter(String value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setPermissionariaFilter');
    try {
      return super.setPermissionariaFilter(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(String value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setDate');
    try {
      return super.setDate(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filter() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.filter');
    try {
      return super.filter();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<String> getSuggestions() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.getSuggestions');
    try {
      return super.getSuggestions();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFilters() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.clearFilters');
    try {
      return super.clearFilters();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseItemCount() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.increaseItemCount');
    try {
      return super.increaseItemCount();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allProcedures: ${allProcedures},
state: ${state},
codeFilter: ${codeFilter},
viaFilter: ${viaFilter},
permissionariaFilter: ${permissionariaFilter},
dateFilter: ${dateFilter},
itemCount: ${itemCount}
    ''';
  }
}
