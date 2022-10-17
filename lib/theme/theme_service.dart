import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  final _storageKey = "themeMode";
  final String light = "light";
  String theme = "";
  Future<ThemeMode> getThemeMode() async {
    await getTheme().then(
      (value) {
        theme = value;
      },
    );
    return theme == "light" ? ThemeMode.light : ThemeMode.dark;
  }

  Future<String> getTheme() async {
    var pfr = await SharedPreferences.getInstance();
    var themeMode = pfr.getString(_storageKey) ?? light;
    print(themeMode);
    return themeMode;
  }

  Future<void> saveChangeMode(String theme) async {
    var pfr = await SharedPreferences.getInstance();
    pfr.setString(_storageKey, theme);
  }

  void changeThemeMode(ThemeMode themeMode, String theme) {
    saveChangeMode(theme);
    Get.changeThemeMode(themeMode);
  }
}
