// ignore_for_file: constant_identifier_names

import 'package:clean_flutter_template/shared/infra/repositories/procedure_repository_http.dart';
import 'package:clean_flutter_template/shared/infra/repositories/procedure_repository_mock.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../domain/repositories/auth_repository_interface.dart';
import '../domain/repositories/procedure_repository_interface.dart';
import '../helpers/enums/environment_enum.dart';
import '../infra/external/http/auth_datasouce_interface.dart';
import '../infra/external/http/procedure_datasource_interface.dart';
import '../infra/repositories/auth_repository.dart';
import '../infra/repositories/auth_repository_mock.dart';

class EnvironmentConfig {
  static const ENV = String.fromEnvironment(
    'ENV',
  );

  static const MSS_USER_BASE_URL = String.fromEnvironment(
    'MSS_USER_BASE_URL',
  );

  static IAuthRepository getUserRepo() {
    EnvironmentEnum value = EnvironmentEnum.values.firstWhere(
      (element) {
        return element.name.toUpperCase() == ENV.toUpperCase();
      },
      orElse: () => EnvironmentEnum.DEV,
    );
    if (value == EnvironmentEnum.DEV) {
      return AuthRepositoryMock();
    } else if (value == EnvironmentEnum.HOMOLOG) {
      return AuthRepository(datasource: Modular.get<IAuthDatasource>());
    }
    // else if (value == EnvironmentEnum.PROD) {
    //   return null;
    else {
      return AuthRepositoryMock();
    }
  }

  static IProcedureRepository getProcedureRepo() {
    EnvironmentEnum value = EnvironmentEnum.values.firstWhere(
      (element) {
        return element.name.toUpperCase() == ENV.toUpperCase();
      },
      orElse: () => EnvironmentEnum.DEV,
    );
    if (value == EnvironmentEnum.DEV) {
      return ProcedureRepositoryMock();
    } else if (value == EnvironmentEnum.HOMOLOG) {
      return ProcedureRepositoryHttp(Modular.get<IProcedureDatasource>());
    }
    // else if (value == EnvironmentEnum.PROD) {
    //   return null;
    else {
      return ProcedureRepositoryMock();
    }
  }
}
