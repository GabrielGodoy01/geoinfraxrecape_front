import 'package:dartz/dartz.dart';

import '../../helpers/errors/errors.dart';
import '../entities/procedure.dart';

abstract class IProcedureRepository {
  Future<Either<Failure, List<Procedure>>> getAllProcedures();
}
