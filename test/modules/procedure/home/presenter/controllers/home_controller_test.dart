import 'dart:ui';

import 'package:clean_flutter_template/app/modules/procedure/home/presenter/controllers/home_controller.dart';
import 'package:clean_flutter_template/app/modules/procedure/home/presenter/states/home_state.dart';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/entities/procedure.dart';
import 'package:clean_flutter_template/shared/domain/usecases/get_all_procedures_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_controller_test.mocks.dart';

@GenerateMocks([
  IGetAllProceduresUsecase,
])
void main() {
  late HomeController controller;
  IGetAllProceduresUsecase usecase = MockIGetAllProceduresUsecase();

  var listProcedures = <Procedure>[
    Procedure(
      protcod: '',
      nomePermissionariaCompleto: '',
      nomePermissionaria: '',
      lat: '',
      long: '',
      dataTermReal: DateTime.now(),
      via: '',
    ),
    Procedure(
      protcod: '',
      nomePermissionariaCompleto: '',
      nomePermissionaria: '',
      lat: '',
      long: '',
      dataTermReal: DateTime.now(),
      via: '',
    ),
    Procedure(
      protcod: '123',
      nomePermissionariaCompleto: '123',
      nomePermissionaria: '123',
      lat: '',
      long: '',
      dataTermReal: DateTime.now(),
      via: '123',
    )
  ];

  var alot = <Procedure>[
    Procedure(
      protcod: '',
      nomePermissionariaCompleto: '',
      nomePermissionaria: '',
      lat: '',
      long: '',
      dataTermReal: DateTime.now(),
      via: '',
    ),
    Procedure(
      protcod: '',
      nomePermissionariaCompleto: '',
      nomePermissionaria: '',
      lat: '',
      long: '',
      dataTermReal: DateTime.now(),
      via: '',
    ),
    Procedure(
      protcod: '',
      nomePermissionariaCompleto: '',
      nomePermissionaria: '',
      lat: '',
      long: '',
      dataTermReal: DateTime.now(),
      via: '',
    ),
    Procedure(
      protcod: '',
      nomePermissionariaCompleto: '',
      nomePermissionaria: '',
      lat: '',
      long: '',
      dataTermReal: DateTime.now(),
      via: '',
    ),
    Procedure(
      protcod: '',
      nomePermissionariaCompleto: '',
      nomePermissionaria: '',
      lat: '',
      long: '',
      dataTermReal: DateTime.now(),
      via: '',
    ),
    Procedure(
      protcod: '',
      nomePermissionariaCompleto: '',
      nomePermissionaria: '',
      lat: '',
      long: '',
      dataTermReal: DateTime.now(),
      via: '',
    ),
  ];

  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - getAllProcedures', () {
    test('must return HomeSuccessState', () async {
      when(usecase.call()).thenAnswer((_) async => Right(listProcedures));
      controller = HomeController(usecase);
      await controller.getAllProcedures();
      expect(controller.state, isA<HomeSuccessState>());
    });

    test('must return HomeErrorState', () async {
      when(usecase.call()).thenAnswer((_) async => Left(Failure(message: '')));
      controller = HomeController(usecase);
      await controller.getAllProcedures();
      expect(controller.state, isA<HomeErrorState>());
    });
  });

  test('getSuggestions', () {
    when(usecase.call()).thenAnswer((_) async => Right(listProcedures));
    controller = HomeController(usecase);
    controller.allProcedures = listProcedures;
    expect(controller.getSuggestions().length, 2);
  });

  group('[TEST] - setter', () {
    test('changeState', () {
      when(usecase.call()).thenAnswer((_) async => Right(listProcedures));
      controller = HomeController(usecase);
      controller.changeState(HomeLoadingState());
      expect(controller.state, isA<HomeLoadingState>());
    });

    test('increaseItemCount if', () {
      when(usecase.call()).thenAnswer((_) async => Right(listProcedures));
      controller = HomeController(usecase);
      controller.changeState(HomeLoadingState());
      controller.itemCount = 10;
      controller.allProcedures = listProcedures;
      controller.increaseItemCount();
      expect(controller.itemCount, 3);
    });

    test('increaseItemCount', () {
      when(usecase.call()).thenAnswer((_) async => Right(listProcedures));
      controller = HomeController(usecase);
      controller.changeState(HomeLoadingState());
      controller.itemCount = alot.length;
      controller.allProcedures = alot;
      controller.increaseItemCount();
      expect(controller.itemCount, 6);
    });

    test('decreaseItemCount', () {
      when(usecase.call()).thenAnswer((_) async => Right(listProcedures));
      controller = HomeController(usecase);
      controller.changeState(HomeLoadingState());
      controller.itemCount = 10;
      controller.decreaseItemCount();
      expect(controller.itemCount, 5);
    });

    test('setCodeFilter', () {
      when(usecase.call()).thenAnswer((_) async => Right(listProcedures));
      controller = HomeController(usecase);
      controller.setCodeFilter('123');
      expect(controller.codeFilter, '123');
    });

    test('setViaFilter', () {
      when(usecase.call()).thenAnswer((_) async => Right(listProcedures));
      controller = HomeController(usecase);
      controller.setViaFilter('123');
      expect(controller.viaFilter, '123');
    });

    test('setPermissionariaFilter', () {
      when(usecase.call()).thenAnswer((_) async => Right(listProcedures));
      controller = HomeController(usecase);
      controller.setPermissionariaFilter('123');
      expect(controller.permissionariaFilter, '123');
    });

    test('filter', () {
      when(usecase.call()).thenAnswer((_) async => Right(listProcedures));
      controller = HomeController(usecase);
      controller.permissionariaFilter = '123';
      controller.viaFilter = '123';
      controller.codeFilter = '123';
      controller.allProcedures = listProcedures;
      controller.filter();
      expect((controller.state as HomeSuccessState).procedures.length, 1);
    });

    test('clearFilters', () {
      when(usecase.call()).thenAnswer((_) async => Right(listProcedures));
      controller = HomeController(usecase);
      controller.permissionariaFilter = '123';
      controller.viaFilter = '123';
      controller.codeFilter = '123';
      controller.allProcedures = listProcedures;
      controller.clearFilters();
      expect(controller.viaFilter, '');
      expect(controller.codeFilter, '');
      expect(controller.permissionariaFilter, '');
      expect((controller.state as HomeSuccessState).procedures.length,
          listProcedures.length);
    });
  });
}
