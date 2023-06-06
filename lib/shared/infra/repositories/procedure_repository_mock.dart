import 'package:clean_flutter_template/shared/domain/repositories/procedure_repository_interface.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/procedure.dart';
import '../../helpers/errors/errors.dart';

class ProcedureRepositoryMock extends IProcedureRepository {
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
      protcod: '',
      nomePermissionariaCompleto: '',
      nomePermissionaria: '',
      lat: '',
      long: '',
      dataTermReal: DateTime.now(),
      via: '',
    )
  ];

  @override
  Future<Either<Failure, List<Procedure>>> getAllProcedures() {
    return Future.value(Right(listProcedures));
  }
}
