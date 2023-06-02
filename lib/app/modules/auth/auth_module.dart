import 'package:clean_flutter_template/app/modules/auth/login/presenter/pages/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../shared/datasource/external/http/auth_datasource.dart';
import '../../../shared/domain/repositories/auth_repository_interface.dart';
import '../../../shared/domain/usecases/get_user_attributes_usecase.dart';
import '../../../shared/domain/usecases/login_user_usecase.dart';
import '../../../shared/environment/environment_config.dart';
import '../../../shared/infra/external/http/auth_datasouce_interface.dart';
import 'guard.dart';
import 'login/presenter/controller/login_controller.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<LoginController>((i) => LoginController(i())),
        Bind<ILoginUserUsecase>((i) => LoginUserUsecase(repository: i())),
        Bind<IGetUserAttributesUsecase>(
            (i) => GetUserAttributesUsecase(repository: i())),
        Bind<IAuthRepository>((i) => EnvironmentConfig.getUserRepo()),
        Bind<IAuthDatasource>((i) => AuthDatasource()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, __) => LoginPage(),
          guards: [AuthGuard()],
        ),
      ];
}
