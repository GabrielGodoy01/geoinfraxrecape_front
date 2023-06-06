import '../../../domain/entities/procedure.dart';
import '../../../helpers/services/http_service.dart';
import '../../../infra/external/http/procedure_datasource_interface.dart';
import '../../../infra/models/procedure_model.dart';

class ProcedureDatasource extends IProcedureDatasource {
  final HttpService _httpService;

  ProcedureDatasource(this._httpService);

  @override
  Future<List<Procedure>> getAllProcedures() async {
    var response = await _httpService.post(
      '/delete-user',
    );
    if (response.statusCode == 200) {
      return ProcedureModel.fromMaps(response.data);
    } else {
      throw Exception();
    }
  }
}
