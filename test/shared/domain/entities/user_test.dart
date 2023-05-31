import 'dart:ui';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/entities/user.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  test('[TEST] - user is valid', () {
    expect(
      () => User(
        id: '',
        email: 'gabriel@godoy.com',
        fullName: 'Gabriel Godoy',
        username: '',
        password: '',
      ),
      isNotNull,
    );
  });

  test('[TEST] - user throw EntityError with invalid name', () {
    expect(
      () => User(
        id: '',
        email: 'gabriel@godoy.com',
        fullName: '',
        username: '',
        password: '',
      ),
      throwsA(isInstanceOf<EntityError>()),
    );
  });

  test('[TEST] - user throw EntityError with invalid email', () {
    expect(
      () => User(
        id: '',
        email: '',
        fullName: 'Gabriel Godoy',
        username: '',
        password: '',
      ),
      throwsA(isInstanceOf<EntityError>()),
    );
  });
}
