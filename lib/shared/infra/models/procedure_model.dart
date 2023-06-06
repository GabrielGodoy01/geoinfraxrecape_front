import 'package:clean_flutter_template/shared/domain/entities/procedure.dart';

class ProcedureModel extends Procedure {
  ProcedureModel(
      {required super.via,
      required super.protcod,
      required super.nomePermissionariaCompleto,
      required super.nomePermissionaria,
      required super.lat,
      required super.long,
      required super.dataTermReal});

  factory ProcedureModel.fromJson(Map<String, dynamic> json) {
    return ProcedureModel(
      protcod: json['protcod'],
      nomePermissionariaCompleto: json['nomePermissionariaCompleto'],
      nomePermissionaria: json['nomePermissionaria'],
      lat: json['lat'],
      long: json['long'],
      dataTermReal: json['dataTermReal'],
      via: json['via'],
    );
  }

  static List<ProcedureModel> fromMaps(List array) {
    return array.map((e) => ProcedureModel.fromJson(e)).toList();
  }
}
