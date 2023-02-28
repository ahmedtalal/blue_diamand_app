// ignore_for_file: avoid_print

import 'package:drinking_app/app/presentation/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/services/local/theme_local_Storage.dart';

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


