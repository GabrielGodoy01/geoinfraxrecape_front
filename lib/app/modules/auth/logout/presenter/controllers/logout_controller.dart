import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../shared/domain/usecases/logout_user_usecase.dart';
import '../states/logout_state.dart';

part 'logout_controller.g.dart';

class LogoutController = LogoutControllerBase with _$LogoutController;

abstract class LogoutControllerBase with Store {
  // final IAuthStorage storage;
  final ILogoutUserUsecase _logout;

  LogoutControllerBase(this._logout);

  @observable
  LogoutState state = LogoutInitialState();

  @action
  void changeState(LogoutState value) => state = value;

  @action
  Future<void> logoutUser() async {
    changeState(LogoutLoadingState());
    var result = await _logout();
    changeState(result.fold((failure) {
      return LogoutErrorState(failure);
    }, (isLogged) {
      return const LogoutSuccessState();
    }));
    if (state is LogoutSuccessState) {
      // await storage.cleanSecureStorage();
      Modular.to.navigate('/');
    }
  }
}
