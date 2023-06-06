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

  @action
  void setCodeFilter(String value) => codeFilter = value;

  @action
  void filterByCode(String value) {
    if (state is HomeSuccessState) {
      final procedures = (state as HomeSuccessState).procedures;
      final filteredProcedures = procedures
          .where((procedure) => procedure.protcod.contains(codeFilter))
          .toList();
      state = HomeSuccessState(filteredProcedures);
    }
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
