// ignore_for_file: avoid_print

import 'package:drinking_app/app/presentation/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  static ThemeController? _themeController;
  ThemeController._internal();
  static ThemeController instance() {
    if (_themeController == null) {
      return _themeController = ThemeController._internal();
    }
    return _themeController!;
  }

  ThemeData getTheme() => ThemeStorage.instance().getKey()
      ? AppThemes.darkTheme
      : AppThemes.lightTheme;
  setTheme() {
    ThemeStorage.instance().setKey();
    ThemeData themeMode = getTheme();
    Get.changeTheme(themeMode);
  }
}

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
