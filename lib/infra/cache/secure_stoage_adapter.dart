import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../data/cache/cache.dart';

class SecureStorageAdapter implements CacheStorage {
  final FlutterSecureStorage secureStorage;

  SecureStorageAdapter({required this.secureStorage});

  @override
  Future<void> save({required String key, required dynamic value}) async {
    try {
      await secureStorage.write(key: key, value: value.toString());
    } catch (error) {
      throw CacheError.saveError;
    }
  }

  @override
  Future<String?> fetch(String key) async {
    try {
      return await secureStorage.read(key: key);
    } catch (error) {
      throw CacheError.fetchError;
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      await secureStorage.delete(key: key);
    } catch (error) {
      throw CacheError.deleteError;
    }
  }
}
