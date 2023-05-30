// ignore_for_file: constant_identifier_names

class EnvironmentConfig {
  static const ENV = String.fromEnvironment(
    'ENV',
  );

  static const MSS_USER_BASE_URL = String.fromEnvironment(
    'MSS_USER_BASE_URL',
  );

  // static IUserRepository getUserRepo() {
  //   EnvironmentEnum value = EnvironmentEnum.values.firstWhere(
  //     (element) {
  //       return element.name.toUpperCase() == ENV.toUpperCase();
  //     },
  //     orElse: () => EnvironmentEnum.DEV,
  //   );
  //   if (value == EnvironmentEnum.DEV) {
  //     return UserRepositoryMock();
  //   } else if (value == EnvironmentEnum.HOMOLOG) {
  //     return UserRepositoryHttp(
  //         datasource: Modular.get<IUserDatasource>(),
  //         storage: Modular.get<UserLocalStorage>());
  //   }
  //   // else if (value == EnvironmentEnum.PROD) {
  //   //   return null;
  //   else {
  //     return UserRepositoryMock();
  //   }
  // }
}
