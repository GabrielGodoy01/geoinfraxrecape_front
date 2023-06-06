import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/procedure.dart';
import '../../domain/repositories/procedure_repository_interface.dart';
import '../../helpers/enums/http_status_code_enum.dart';
import '../../helpers/errors/errors.dart';
import '../../helpers/functions/get_http_status_function.dart';
import '../external/http/procedure_datasource_interface.dart';

class ProcedureRepositoryHttp extends IProcedureRepository {
  final IProcedureDatasource datasource;

  ProcedureRepositoryHttp(this.datasource);

  @override
  Future<Either<Failure, List<Procedure>>> getAllProcedures() async {
    List<Procedure> list = [];
    try {
      list = await datasource.getAllProcedures();
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
      //caso erro venha do back
      //return left(ErrorRequest(message: e.response?.data));
    }
    return right(list);
  }
}
