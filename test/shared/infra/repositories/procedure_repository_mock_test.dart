import 'package:clean_flutter_template/shared/domain/entities/procedure.dart';
import 'package:clean_flutter_template/shared/infra/repositories/procedure_repository_mock.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ProcedureRepositoryMock procedureRepositoryMock = ProcedureRepositoryMock();

  group('[TEST] - ProcedureRepositoryMock', () {
    test('should return List<Procedure>', () async {
      var result = await procedureRepositoryMock.getAllProcedures();
      expect(result.fold((l) => l, (r) => r), isA<List<Procedure>>());
    });
  });
}
