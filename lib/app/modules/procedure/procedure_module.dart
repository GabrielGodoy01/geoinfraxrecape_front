import 'package:clean_flutter_template/app/modules/procedure/more-info/presenter/ui/more_info_page.dart';
import 'package:clean_flutter_template/shared/datasource/external/http/procedure_datasource.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/domain/repositories/procedure_repository_interface.dart';
import '../../../shared/domain/usecases/get_all_procedures_usecase.dart';
import '../../../shared/environment/environment_config.dart';
import '../../../shared/infra/external/http/procedure_datasource_interface.dart';
import 'home/presenter/controllers/home_controller.dart';
import 'home/presenter/ui/home_page.dart';

class ProcedureModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i())),
        Bind<IGetAllProceduresUsecase>((i) => GetAllProceduresUsecase(i())),
        Bind<IGetAllProceduresUsecase>((i) => GetAllProceduresUsecase(i())),
        Bind<IProcedureRepository>((i) => EnvironmentConfig.getProcedureRepo()),
        Bind<IProcedureDatasource>((i) => ProcedureDatasource(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/home', child: (_, __) => const HomePage()),
        ChildRoute(Modular.initialRoute, child: (_, __) => MoreInfoPage()),
      ];
}
