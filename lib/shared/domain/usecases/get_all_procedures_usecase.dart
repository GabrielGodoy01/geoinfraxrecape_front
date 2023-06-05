import 'package:dartz/dartz.dart';

import '../../helpers/errors/errors.dart';
import '../entities/procedure.dart';
import '../repositories/procedure_repository_interface.dart';

abstract class IGetAllProceduresUsecase {
  Future<Either<Failure, List<Procedure>>> call();
}

class GetAllProceduresUsecase implements IGetAllProceduresUsecase {
  final IProcedureRepository repository;

  GetAllProceduresUsecase(this.repository);

  @override
  Future<Either<Failure, List<Procedure>>> call() async {
    return await repository.getAllProcedures();
  }
}
