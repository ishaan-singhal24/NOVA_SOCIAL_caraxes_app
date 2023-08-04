import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nova_social/data/constants/constants.dart';

class SecureStorage {
  static final SecureStorage _localDataStorage = SecureStorage._internal();

  factory SecureStorage() {
    return _localDataStorage;
  }

  SecureStorage._internal();

  final secureStorage = FlutterSecureStorage(
    aOptions: Platform.isAndroid
        ? const AndroidOptions(
            encryptedSharedPreferences: true,
          )
        : AndroidOptions.defaultOptions,
  );

  Future<bool> addPreferences(String key, String value) async {
    try {
      await secureStorage.write(key: key, value: value);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> addBoolPreferences(String key, bool value) async {
    return await addPreferences(key, value.toString());
  }

  Future<dynamic> getPreference(String key) async {
    var value = await secureStorage.read(key: key);
    return value == null ? null : jsonDecode(value);
  }

  Future<String?> getToken(String key) async {
    var value = await secureStorage.read(key: key);
    return value;
  }

  Future<bool?> getBoolPref(String key) async {
    var value = await secureStorage.read(key: key);
    if (value != null) {
      return value.toLowerCase() == 'true';
    }
    return null;
  }

  Future<void> removePref(String key) async {
    await secureStorage.delete(key: key);
  }

  Future<void> removeAllPrefs() async {
    var isFirstTime = await getBoolPref(AppKeyNames.isFirstTime);
    await secureStorage.deleteAll();
    addBoolPreferences(AppKeyNames.isFirstTime, isFirstTime ?? false);
  }
}
