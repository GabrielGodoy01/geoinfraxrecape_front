import 'package:clean_flutter_template/shared/domain/entities/procedure.dart';
import 'package:clean_flutter_template/shared/domain/repositories/procedure_repository_interface.dart';
import 'package:clean_flutter_template/shared/domain/usecases/get_all_procedures_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_procedures_usecase_test.mocks.dart';

@GenerateMocks([IProcedureRepository])
void main() {
  late IGetAllProceduresUsecase usecase;
  IProcedureRepository repository = MockIProcedureRepository();

  setUp(() {
    usecase = GetAllProceduresUsecase(repository);
  });

  group('[TEST] - getAllProcedures', () {
    test('should return List<Procedure>', () async {
      when(repository.getAllProcedures()).thenAnswer((_) async => Right([
            Procedure(
              protcod: '',
              nomePermissionariaCompleto: '',
              nomePermissionaria: '',
              lat: '',
              long: '',
              dataTermReal: DateTime.now(),
              via: '',
            )
          ]));
      var result = await usecase();
      expect(result.fold((l) => l, (r) => r), isA<List<Procedure>>());
    });

    test('should return Failure', () async {
      when(repository.getAllProcedures())
          .thenAnswer((_) async => Left(Failure(message: '')));
      final result = await usecase();
      expect(result.fold((l) => l, (r) => r), isA<Failure>());
    });
  });
}
