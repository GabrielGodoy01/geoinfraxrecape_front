import 'package:clean_flutter_template/shared/domain/entities/procedure.dart';
import 'package:clean_flutter_template/shared/domain/repositories/procedure_repository_interface.dart';
import 'package:clean_flutter_template/shared/domain/usecases/get_all_procedures_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([IProcedureRepository])
void main() {
  late IGetAllProceduresUsecase usecase;
  IProcedureRepository repository = MockIProcedureRepository();

  setUp(() {
    usecase = GetAllProceduresUsecase();
  });

  group('[TEST] - getAllProcedures', () {
    test('should return List<Procedures>', () {
      when(repository.getAllProcedures()).thenAnswer((_) async => [
            Procedure(
                protcod: '',
                nomePermissionariaCompleto: '',
                nomePermissionaria: '',
                lat: '',
                long: '',
                dataTermReal: DateTime.now())
          ]);
      final result = usecase();
      expect(result, []);
    });
  });
}
