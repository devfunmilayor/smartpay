import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';



SharedPrefUtils sharedPrefUtils = SharedPrefUtils();

@prod
@test
@dev
@lazySingleton
class SharedPrefUtils {
  static SharedPreferences? _sharedPrefs;

  // factory SharedPrefUtils() => SharedPrefUtils._internal();
  // SharedPrefUtils._internal();

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  setMap({required String key, required Map value}) {
    init();
    _sharedPrefs?.setString(key, json.encode(value));
  }

  Map getMap({required String key}) {
    init();

    return json.decode(_sharedPrefs?.getString(key) ?? '{}');
  }

  void clearAll() async {
    await _sharedPrefs?.clear();
  }

  setString({required String key, required String value}) {
    init();
    _sharedPrefs?.setString(key, value);
  }

  String getString({required String key}) {
    init();
    return _sharedPrefs?.getString(key) ?? '';
  }

  setBool({required String key, required bool value}) {
    init();
    _sharedPrefs?.setBool(key, value);
  }

  setStringList({required String key, required List<String> value}) {
    init();
    _sharedPrefs?.setStringList(key, value);
  }

  getStringList({required String key}) {
    init();
    return _sharedPrefs?.getStringList(key) ?? [];
  }

  bool getBool({required String key}) {
    init();
    return _sharedPrefs?.getBool(key) ?? false;
  }

  setInt({required key, required int value}) {
    init();
    _sharedPrefs?.setInt(key, value);
  }

  int? getInt({required String key, required String value}) {
    init();
    return _sharedPrefs?.getInt(key);
  }

  Future<bool>? removeKey(String key) {
    return _sharedPrefs?.remove(key);
  }

  reload() {
    init();
    _sharedPrefs?.reload();
  }
}
