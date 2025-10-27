import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  static const _themeModeKey = 'theme_mode';

  late SharedPreferences _preferences;

  Future<StorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  String? readThemeMode() => _preferences.getString(_themeModeKey);

  Future<void> writeThemeMode(String mode) async {
    await _preferences.setString(_themeModeKey, mode);
  }

  List<String>? readStringList(String key) => _preferences.getStringList(key);

  Future<void> writeStringList(String key, List<String> values) async {
    await _preferences.setStringList(key, values);
  }

  Future<void> remove(String key) async {
    await _preferences.remove(key);
  }
}
