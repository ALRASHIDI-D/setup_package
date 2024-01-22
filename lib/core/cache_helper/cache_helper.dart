import 'package:common_setup/core/utils/consts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper {
  final FlutterSecureStorage storage;

  CacheHelper({required this.storage});

  Future<String?> getToken() async {
    return await storage.read(key: AppConstants.tokenKeyForLocalStorage);
  }

  Future<void> setToken(String value) async {
    return await storage.write(
        key: AppConstants.tokenKeyForLocalStorage, value: value);
  }
}
