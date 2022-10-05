import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _theme = 'theme';

class SettingsService {
  SettingsService(this._prefs);

  final SharedPreferences _prefs;

  Future<ThemeMode> getThemeMode() async {
    try {
      final themeStr = _prefs.getString(_theme);

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
    await _prefs.setString(_theme, theme.name);
  }
}
