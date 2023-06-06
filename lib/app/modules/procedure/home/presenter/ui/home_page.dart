import 'package:clean_flutter_template/app/modules/procedure/home/presenter/ui/widgets/filter_textfield_widget.dart';
import 'package:clean_flutter_template/app/modules/procedure/home/presenter/ui/widgets/procedure_card_widget.dart';
import 'package:clean_flutter_template/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../shared/domain/entities/procedure.dart';
import '../../../../../../shared/widgets/text_field_custom_widget.dart';
import '../controllers/home_controller.dart';
import '../states/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<HomeController>();
    return Scaffold(
        body: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text('Sistema nomeSistema',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    )),
            Text('Lista de Dados Emergenciais dataAtual - dataOntem',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Observer(builder: (_) {
              var state = controller.state;
              return state is HomeLoadingState
                  ? const CircularProgressIndicator()
                  : state is HomeSuccessState
                      ? _buildSuccess(state.procedures, context)
                      : state is HomeErrorState
                          ? Text(state.error.message)
                          : Container();
            }),
          ],
        ),
      ),
    ));
  }

  Widget _buildSuccess(List<Procedure> procedures, BuildContext context) {
    var controller = Modular.get<HomeController>();
    return Expanded(
      child: Column(
        children: [
          Card(
            child: TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Filtro'),
                          content: FilterTextfieldWidget(
                            hintText: 'Código',
                            onChanged: controller.setCodeFilter,
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Limpar')),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Fechar')),
                          ],
                        );
                      });
                },
                child: const Text('Filtro')),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: procedures.length,
                itemBuilder: (_, index) {
                  var procedure = procedures[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: ProcedureCardWidget(
                      procedure: procedure,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
