import 'package:clean_flutter_template/shared/domain/entities/procedure.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<Procedure> procedures;

  const HomeSuccessState(this.procedures);
}

class HomeErrorState extends HomeState {
  final Failure error;

  const HomeErrorState({required this.error});
}
