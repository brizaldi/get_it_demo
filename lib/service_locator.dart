import 'package:get_it/get_it.dart';
import 'package:get_it_demo/src/sample_feature/core/service/sample_service.dart';
import 'package:get_it_demo/src/sample_feature/list/application/sample_list_cubit.dart';
import 'package:get_it_demo/src/settings/application/settings_cubit.dart';
import 'package:get_it_demo/src/settings/service/settings_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/sample_feature/details/application/sample_detail_cubit.dart';

final sl = GetIt.instance;

Future<void> setUpLocator() async {
  sl.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });

  sl.registerLazySingleton<SettingsService>(() => SettingsService(sl.get<SharedPreferences>()));
  sl.registerLazySingleton<SampleService>(() => SampleService());

  sl.registerFactory<SettingsCubit>(() => SettingsCubit(sl.get<SettingsService>()));
  sl.registerFactory<SampleListCubit>(() => SampleListCubit(sl.get<SampleService>()));
  sl.registerFactory<SampleDetailCubit>(() => SampleDetailCubit(sl.get<SampleService>()));

  await sl.allReady();
}
