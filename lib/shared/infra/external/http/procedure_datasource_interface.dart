import 'package:dartz/dartz.dart';

import '../../../domain/entities/procedure.dart';
import '../../../helpers/errors/errors.dart';

abstract class IProcedureDatasource {
  Future<Either<Failure, List<Procedure>>> getAllProcedures();
}
