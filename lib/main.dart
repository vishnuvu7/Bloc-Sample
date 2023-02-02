import 'package:bloc_sample/di/di.dart';
import 'package:bloc_sample/routing/router.dart';
import 'package:bloc_sample/service/hive_manager.dart';
import 'package:bloc_sample/utils/common_utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  initializeDependencyInjection();
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive [local storage]
  await Hive.initFlutter();
  await Hive.openBox(HiveManager.blocBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sample Bloc Project',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: AppColors.generateMaterialColor(AppColors.primary),
      ),
      routerConfig: router,
    );
  }
}
