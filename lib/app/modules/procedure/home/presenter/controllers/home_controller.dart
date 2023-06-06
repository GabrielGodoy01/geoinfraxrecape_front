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
  HomeState state = HomeInitialState();

  @action
  void changeState(HomeState value) => state = value;

  @action
  Future<void> getAllProcedures() async {
    state = HomeLoadingState();
    final result = await _getAllProcedures();
    changeState(result.fold((error) => HomeErrorState(error: error),
        (procedures) => HomeSuccessState(procedures)));
  }
}
