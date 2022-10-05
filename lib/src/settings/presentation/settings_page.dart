import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../application/settings_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<SettingsCubit, ThemeMode>(
          listener: (BuildContext context, ThemeMode theme) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Current theme has been set to ${theme.name}')));
          },
          builder: (BuildContext context, ThemeMode theme) {
            return DropdownButton<ThemeMode>(
              value: theme,
              onChanged: context.read<SettingsCubit>().updateSettings,
              items: const [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('System Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('Light Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text('Dark Theme'),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
