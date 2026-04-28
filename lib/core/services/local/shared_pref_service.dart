import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  final SharedPreferences _prefs;

  SharedPrefService(this._prefs);

  // ------------------- Common -------------------
  bool containsKey(String key) => _prefs.containsKey(key);

  Future<void> remove(String key) async => _prefs.remove(key);

  Future<void> clear() async => _prefs.clear();

  // ------------------- Primitives -------------------
  //*************** Bool ************************
  bool getBool(String key, {bool defaultValue = false}) =>
      _prefs.getBool(key) ?? defaultValue;

  Future<void> setBool(String key, bool value) async =>
      _prefs.setBool(key, value);

  //*************** Int ************************
  int getInt(String key, {int defaultValue = 0}) =>
      _prefs.getInt(key) ?? defaultValue;

  Future<void> setInt(String key, int value) async => _prefs.setInt(key, value);

  //*************** double ************************
  double getDouble(String key, {double defaultValue = 0.0}) =>
      _prefs.getDouble(key) ?? defaultValue;

  Future<void> setDouble(String key, double value) async =>
      _prefs.setDouble(key, value);

  //*************** String ************************
  String getString(String key, {String defaultValue = ''}) =>
      _prefs.getString(key) ?? defaultValue;

  Future<void> setString(String key, String value) async =>
      _prefs.setString(key, value);

  //*************** List of String ************************
  List<String> getStringList(
    String key, {
    List<String> defaultValue = const [],
  }) => _prefs.getStringList(key) ?? defaultValue;

  Future<void> setStringList(String key, List<String> value) async =>
      _prefs.setStringList(key, value);

  //TODO: Json & object ...
}
