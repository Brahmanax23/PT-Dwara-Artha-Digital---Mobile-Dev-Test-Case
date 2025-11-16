import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testcase/core/navigator/navigator_service.dart';

class CoreDependencies {
  static Future<void> init() async {
    final getIt = GetIt.instance;

    getIt.registerLazySingleton(() => NavigatorService());

    final sharedPreferences = await SharedPreferences.getInstance();

    getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  }
}
