import 'package:clean_flutter_template/app/modules/procedure/home/presenter/ui/widgets/filter_textfield_widget.dart';
import 'package:clean_flutter_template/app/modules/procedure/home/presenter/ui/widgets/procedure_card_widget.dart';
import 'package:clean_flutter_template/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import '../../../../../../shared/domain/entities/procedure.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../controllers/home_controller.dart';
import '../states/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<HomeController>();
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
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
      ),
    ));
  }

  Widget _buildSuccess(List<Procedure> procedures, BuildContext context) {
    var controller = Modular.get<HomeController>();
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem<String>(
        value: '',
        child: Text('Permissionária'),
      )
    ];
    menuItems.addAll(controller.getSuggestions().map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList());
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilterTextfieldWidget(
              width: 300,
              hintText: 'Código',
              onChanged: controller.setCodeFilter,
            ),
            SizedBox(
              width: 300,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    hintText: controller.permissionariaFilter.isEmpty
                        ? 'Permissionária'
                        : controller.permissionariaFilter,
                    suffixIconColor: Theme.of(context).colorScheme.primary,
                    fillColor: AppColors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.grey, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.grey, width: 2),
                    )),
                style: controller.permissionariaFilter.isEmpty
                    ? Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: AppColors.grey, fontWeight: FontWeight.normal)
                    : Theme.of(context).textTheme.displaySmall,
                items: menuItems,
                value: controller.permissionariaFilter,
                onChanged: (value) =>
                    controller.setPermissionariaFilter(value!),
              ),
            ),
            SizedBox(
              width: 300,
              height: 60,
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.grey, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.dateFilter.isEmpty
                            ? 'Data'
                            : controller.dateFilter,
                        style: controller.dateFilter.isEmpty
                            ? Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.normal)
                            : Theme.of(context).textTheme.displaySmall,
                      ),
                      IconButton(
                        onPressed: () {
                          showDatePicker(
                              context: context,
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2021),
                              lastDate: DateTime(2024),
                              builder: ((context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                      textTheme: TextTheme(
                                          displaySmall:
                                              AppTextStyles.displaySmall)),
                                  child: child!,
                                );
                              })).then((date) {
                            if (date == null) return;
                            var formattedDate =
                                DateFormat('dd/MM/yyyy').format(date);
                            controller.setDate(formattedDate);
                          });
                        },
                        icon: const Icon(Icons.calendar_today),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilterTextfieldWidget(
              width: 1000,
              hintText: 'Via',
              onChanged: controller.setViaFilter,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.black,
              ),
              onPressed: () {
                controller.clearFilters();
              },
              child: const Text('Limpar filtros'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Card(
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Total de dados: ${controller.allProcedures.length}',
              style: Theme.of(context).textTheme.displaySmall!,
            ),
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
            shrinkWrap: true,
            itemCount: controller.itemCount,
            itemBuilder: (_, index) {
              var procedure = procedures[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: ProcedureCardWidget(
                  procedure: procedure,
                ),
              );
            }),
        ElevatedButton(
            onPressed: () {
              controller.allProcedures.length == controller.itemCount
                  ? controller.decreaseItemCount()
                  : controller.increaseItemCount();
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: AppColors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Icon(
              controller.allProcedures.length == controller.itemCount
                  ? Icons.remove_circle
                  : Icons.add_circle,
              size: 60,
            )),
        const SizedBox(height: 32),
      ],
    );
  }
}
