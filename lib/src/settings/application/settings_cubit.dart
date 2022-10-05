import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../service/settings_service.dart';

class SettingsCubit extends Cubit<ThemeMode> {
  SettingsCubit(this._service) : super(ThemeMode.system);

  final SettingsService _service;

  void loadSettings() async {
    final theme = await _service.getThemeMode();
    emit(theme);
  }

  void updateSettings(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    if (newThemeMode == state) return;

    emit(newThemeMode);

    await _service.updateThemeMode(newThemeMode);
  }
}
