import 'package:flutter_modular/flutter_modular.dart';

import 'home/presenter/ui/home_page.dart';

class ProcedureModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const HomePage()),
      ];
}
