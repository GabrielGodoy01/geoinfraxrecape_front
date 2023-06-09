import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/storage/auth_storage_interface.dart';

class AuthStorage extends IAuthStorage {
  final Box storage;

  AuthStorage._(this.storage);

  static Future<AuthStorage> instance() async {
    await Hive.initFlutter();
    return AuthStorage._(await Hive.openBox('box'));
  }

  @override
  Future<void> saveRefreshToken(String refreshToken) async {
    await storage.put('refreshToken', refreshToken);
  }

  @override
  Future<void> saveAccessToken(String accessToken) async {
    await storage.put('accessToken', accessToken);
  }

  @override
  Future<String> getRefreshToken() async {
    return await storage.get('refreshToken') ?? '';
  }

  @override
  Future<String> getAccessToken() async {
    return await storage.get('accessToken') ?? '';
  }

  @override
  Future<String> getIdToken() async {
    return await storage.get('idToken') ?? '';
  }

  @override
  Future<void> saveIdToken(String idToken) async {
    await storage.put('idToken', idToken);
  }

  @override
  Future<void> cleanSecureStorage() async {
    await storage.clear();
  }
}
