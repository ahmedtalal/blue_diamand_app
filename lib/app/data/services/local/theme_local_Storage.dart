import 'package:get_storage/get_storage.dart';

class ThemeStorage {
  static ThemeStorage? _themeStorage;
  ThemeStorage._internal();
  static ThemeStorage instance() {
    if (_themeStorage == null) {
      return _themeStorage = ThemeStorage._internal();
    }
    return _themeStorage!;
  }

  static final GetStorage _storage = GetStorage();
  static const String _themeKey = "themeKey";

  bool getKey() => _storage.read(_themeKey) ?? false;
  setKey() async {
    bool result = !getKey();
    print("the value of key  is $result");
    await _storage.write(_themeKey, result);
  }
}