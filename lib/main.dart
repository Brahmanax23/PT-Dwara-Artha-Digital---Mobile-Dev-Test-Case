import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testcase/core/service/core_dependencies.dart';
import 'package:testcase/presentation/app_material/app_material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await initializeDateFormatting('id_ID', null);

  await CoreDependencies.init();
  runApp(const AppMaterial());
}
