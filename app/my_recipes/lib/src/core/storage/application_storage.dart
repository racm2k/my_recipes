part 'storage_keys.dart';

abstract class ApplicationStorage {
  Future<void> delete();
  Future<bool> exists(StorageKeys key);
  Future<String?> read(StorageKeys key);
  Future<void> write(StorageKeys key, String value);
}