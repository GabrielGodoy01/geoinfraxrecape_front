import 'package:clean_flutter_template/app/modules/procedure/home/presenter/ui/widgets/procedure_card_widget.dart';
import 'package:clean_flutter_template/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../shared/domain/entities/procedure.dart';
import '../controllers/home_controller.dart';
import '../states/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<HomeController>();
    return Scaffold(
        backgroundColor: AppColors.black,
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Observer(builder: (_) {
              var state = controller.state;
              return state is HomeLoadingState
                  ? const CircularProgressIndicator()
                  : state is HomeSuccessState
                      ? _buildSuccess(state.procedures)
                      : state is HomeErrorState
                          ? Text(state.error.message)
                          : Container();
            }),
          ),
        ));
  }

  Widget _buildSuccess(List<Procedure> procedures) {
    return ListView.builder(
        itemCount: procedures.length,
        itemBuilder: (_, index) {
          var procedure = procedures[index];
          return ProcedureCardWidget(
            procedure: procedure,
          );
        });
  }
}
