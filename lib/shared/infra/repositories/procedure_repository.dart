import 'package:dartz/dartz.dart';

import '../../domain/entities/procedure.dart';
import '../../domain/repositories/procedure_repository_interface.dart';
import '../../helpers/errors/errors.dart';
import '../external/http/procedure_datasource_interface.dart';

class ProcedureRepository implements IProcedureRepository {
  final IProcedureDatasource datasource;

  ProcedureRepository(this.datasource);

  @override
  Future<Either<Failure, List<Procedure>>> getAllProcedures() async {
    var result = await datasource.getAllProcedures();
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
