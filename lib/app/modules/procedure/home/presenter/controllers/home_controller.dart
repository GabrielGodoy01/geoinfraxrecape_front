import 'package:clean_flutter_template/shared/domain/entities/procedure.dart';
import 'package:clean_flutter_template/shared/domain/usecases/get_all_procedures_usecase.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../states/home_state.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final IGetAllProceduresUsecase _getAllProcedures;

  HomeControllerBase(this._getAllProcedures) {
    getAllProcedures();
  }

  @observable
  List<Procedure> allProcedures = [];

  @observable
  HomeState state = HomeInitialState();

  @action
  void changeState(HomeState value) => state = value;

  @observable
  String codeFilter = '';

  @observable
  String viaFilter = '';

  @observable
  String permissionariaFilter = '';

  @observable
  String dateFilter = '';

  @action
  void setCodeFilter(String value) {
    codeFilter = value;
    filter();
  }

  @action
  void setViaFilter(String value) {
    viaFilter = value;
    filter();
  }

  @action
  void setPermissionariaFilter(String value) {
    permissionariaFilter = value;
    filter();
  }

  @action
  void setDate(String value) {
    dateFilter = value;
    filter();
  }

  @action
  void filter() {
    var filtered = allProcedures;
    if (codeFilter.isNotEmpty) {
      filtered = filtered
          .where((element) =>
              element.protcod.toLowerCase().contains(codeFilter.toLowerCase()))
          .toList();
    }
    if (viaFilter.isNotEmpty) {
      filtered = filtered
          .where((element) =>
              element.via.toLowerCase().contains(viaFilter.toLowerCase()))
          .toList();
    }
    if (permissionariaFilter.isNotEmpty) {
      filtered = filtered
          .where((element) => element.nomePermissionaria
              .toLowerCase()
              .contains(permissionariaFilter.toLowerCase()))
          .toList();
    }
    if (dateFilter.isNotEmpty) {
      filtered = filtered.where((element) {
        var date = DateFormat('dd/MM/yyyy').format(element.dataTermReal);
        return dateFilter == date;
      }).toList();
    }
    filtered.length > 5 ? itemCount = 5 : itemCount = filtered.length;

    state = HomeSuccessState(filtered);
  }

  @action
  List<String> getSuggestions() {
    return allProcedures.map((e) => e.nomePermissionaria).toSet().toList();
  }

  @action
  void clearFilters() {
    codeFilter = '';
    viaFilter = '';
    permissionariaFilter = '';
    dateFilter = '';
    state = HomeSuccessState(allProcedures);
  }

  @observable
  int itemCount = 5;

  @action
  void increaseItemCount() {
    var max = allProcedures.length;
    if (itemCount + 5 >= max) {
      itemCount = max;
      return;
    }
    itemCount += 5;
  }

  @action
  Future<void> getAllProcedures() async {
    state = HomeLoadingState();
    final result = await _getAllProcedures();
    changeState(
        result.fold((error) => HomeErrorState(error: error), (procedures) {
      allProcedures = procedures;
      return HomeSuccessState(procedures);
    }));
  }
}
