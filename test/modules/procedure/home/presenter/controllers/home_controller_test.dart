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
    ),
    Procedure(
      protcod: '',
      nomePermissionariaCompleto: '',
      nomePermissionaria: '',
      lat: '',
      long: '',
      dataTermReal: DateTime.now(),
    ),
    Procedure(
      protcod: '',
      nomePermissionariaCompleto: '',
      nomePermissionaria: '',
      lat: '',
      long: '',
      dataTermReal: DateTime.now(),
    )
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

  group('[TEST] - setter', () {
    test('changeState', () {
      when(usecase.call()).thenAnswer((_) async => Right(listProcedures));
      controller = HomeController(usecase);
      controller.changeState(HomeLoadingState());
      expect(controller.state, isA<HomeLoadingState>());
    });
  });
}
