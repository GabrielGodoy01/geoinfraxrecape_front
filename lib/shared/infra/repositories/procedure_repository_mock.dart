import 'package:clean_flutter_template/shared/domain/repositories/procedure_repository_interface.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/procedure.dart';
import '../../helpers/errors/errors.dart';

class ProcedureRepositoryMock implements IProcedureRepository {
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

  @override
  Future<Either<Failure, List<Procedure>>> getAllProcedures() {
    return Future.value(Right(listProcedures));
  }
}
