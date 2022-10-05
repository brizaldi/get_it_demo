import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../service_locator.dart';
import 'sample_feature/details/presentation/sample_item_details_page.dart';
import 'sample_feature/list/presentation/sample_item_list_page.dart';
import 'settings/application/settings_cubit.dart';
import 'settings/presentation/settings_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl.get<SettingsCubit>()..loadSettings(),
        ),
      ],
      child: BlocBuilder<SettingsCubit, ThemeMode>(
        builder: (BuildContext context, ThemeMode theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            restorationScopeId: 'app',
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''),
            ],
            onGenerateTitle: (BuildContext context) => AppLocalizations.of(context)!.appTitle,
            theme: ThemeData(),
            darkTheme: ThemeData.dark(),
            themeMode: theme,
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case SettingsPage.routeName:
                      return const SettingsPage();
                    case SampleItemDetailsPage.routeName:
                      final id = routeSettings.arguments as int;
                      return SampleItemDetailsPage(id: id);
                    case SampleItemListPage.routeName:
                    default:
                      return const SampleItemListPage();
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
