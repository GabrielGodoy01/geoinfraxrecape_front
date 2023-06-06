import 'package:clean_flutter_template/shared/domain/repositories/procedure_repository_interface.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/procedure.dart';
import '../../helpers/errors/errors.dart';

class ProcedureRepositoryMock extends IProcedureRepository {
  var listProcedures = <Procedure>[
    Procedure(
      protcod: '47284559',
      nomePermissionariaCompleto:
          'Companhia de Saneamento Básico do Estado de São Paulo',
      nomePermissionaria: 'SABESP/MLQA',
      lat: '-23.565032',
      long: '-46.464612	',
      dataTermReal: DateTime.now(),
      via: 'Rua Samuel Morse',
    ),
    Procedure(
      protcod: '47408913',
      nomePermissionariaCompleto:
          'Companhia de Saneamento Básico do Estado de São Paulo',
      nomePermissionaria: 'SABESP/MLQA',
      lat: '-23.539804',
      long: '-46.460793',
      dataTermReal: DateTime.now(),
      via: 'Rua Samuel Morse',
    ),
    Procedure(
      protcod: '47686778',
      nomePermissionariaCompleto:
          'Companhia de Saneamento Básico do Estado de São Paulo',
      nomePermissionaria: 'SABESP/MCRV',
      lat: '-23.528308',
      long: '-46.710216',
      dataTermReal: DateTime.now(),
      via: 'Rua Samuel Morse',
    )
  ];

  @override
  Future<Either<Failure, List<Procedure>>> getAllProcedures() {
    return Future.value(Right(listProcedures));
  }
}
