import 'package:clean_flutter_template/shared/domain/entities/procedure.dart';
import 'package:clean_flutter_template/shared/domain/usecases/get_all_procedures_usecase.dart';
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

  @action
  List<Procedure> filterByCode() {
    final procedures = (state as HomeSuccessState).procedures;
    final filteredProcedures = procedures
        .where((procedure) => procedure.protcod.contains(codeFilter))
        .toList();
    return filteredProcedures;
  }

  @action
  List<Procedure> filterByVia() {
    final procedures = (state as HomeSuccessState).procedures;
    final filteredProcedures = procedures
        .where((procedure) => procedure.via.contains(viaFilter))
        .toList();
    return filteredProcedures;
  }

  @action
  void filter() {
    var filtered = <Procedure>[];
    if (state is HomeSuccessState) {
      if (codeFilter.isNotEmpty) filtered = filterByCode();
    }
    state = HomeSuccessState(filtered);
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
