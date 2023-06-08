import '../../../domain/entities/procedure.dart';

abstract class IProcedureDatasource {
  Future<List<Procedure>> getAllProcedures();
}
