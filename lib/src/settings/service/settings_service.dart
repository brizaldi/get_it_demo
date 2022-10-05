import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _theme = 'theme';

class SettingsService {
  Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final themeStr = prefs.getString(_theme);

      if (themeStr != null) {
        return ThemeMode.values.byName(themeStr);
      } else {
        return ThemeMode.system;
      }
    } catch (_) {
      return ThemeMode.system;
    }
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_theme, theme.name);
  }
}
