import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app/errors/errors.dart';

///Local Storage service provider
///This provider is used to perform CRUD operations on local storage
final Provider<LocalStorageAPI> localStorageAPIProvider =
    Provider<LocalStorageAPI>(
  name: 'localStorageProvider',
  (ProviderRef<LocalStorageAPI> ref) =>
      LocalStorageAPI(storage: const FlutterSecureStorage()),
);

//Flutter secure storage
class LocalStorageAPI {
  late final FlutterSecureStorage _storage;

  LocalStorageAPI({required FlutterSecureStorage storage}) : _storage = storage;

  ///Retrieve the value from storage
  FutureEither<String?> getValue(String key,
      {WindowsOptions? windowsOptions}) async {
    try {
      return right(await _storage.read(key: key, wOptions: windowsOptions));
    } on PlatformException catch (e, stackTrace) {
      return left(e.toFailure(stackTrace));
    }
  }

  ///Write value to storage
  FutureEitherVoid writeValue(String key, String value,
      {WindowsOptions? windowsOptions}) async {
    try {
      return right(await _storage.write(
          key: key, value: value, wOptions: windowsOptions));
    } on PlatformException catch (e, stackTrace) {
      return left(e.toFailure(stackTrace));
    }
  }

  //Delete value from storage
  FutureEitherVoid deleteValue(String key,
      {WindowsOptions? windowsOptions}) async {
    try {
      return right(await _storage.delete(key: key, wOptions: windowsOptions));
    } on PlatformException catch (e, stackTrace) {
      return left(e.toFailure(stackTrace));
    }
  }

  ///Delete all values from disk
  FutureEitherVoid deleteAll({WindowsOptions? windowsOptions}) async {
    try {
      return right(await _storage.deleteAll(wOptions: windowsOptions));
    } on PlatformException catch (e, stackTrace) {
      return left(e.toFailure(stackTrace));
    }
  }

  ///Get all values from disk
  FutureEither<Map<String, String>> readAll(
      {WindowsOptions? windowsOptions}) async {
    try {
      return right(await _storage.readAll(wOptions: windowsOptions));
    } on PlatformException catch (e, stackTrace) {
      return left(e.toFailure(stackTrace));
    }
  }

  ///Check if the provided key exists in storage
  Future<bool> containsKey(String key, {WindowsOptions? windowsOptions}) async {
    return _storage.containsKey(key: key, wOptions: windowsOptions);
  }
}
