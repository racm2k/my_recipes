import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'application_storage.dart';

class ApplicationStorageImpl implements ApplicationStorage {
  const ApplicationStorageImpl({required FlutterSecureStorage storage})
      : _storage = storage;

  final FlutterSecureStorage _storage;


  @override
  Future<void> delete() async {
    await _storage.deleteAll();
  }

  @override
  Future<bool> exists(StorageKeys key) async {
    return _storage.containsKey(key: key.value);
  }

  @override
  Future<String?> read(StorageKeys key) async {
    return _storage.read(key: key.value);
  }

  @override
  Future<void> write(StorageKeys key, String value) async {
    await _storage.write(key:key.value, value: value);
  }


}