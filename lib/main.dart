import 'package:bloc_sample/di/di.dart';
import 'package:bloc_sample/routing/router.dart';
import 'package:bloc_sample/storage/hive_manager.dart';
import 'package:bloc_sample/utils/common_utils/theme/change_theme_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  //Initialize service locators
  initializeDependencyInjection();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // Initialize Hive [local storage]
  await Hive.initFlutter();
  await Hive.openBox(HiveManager.blocBox);
  runApp(
      //Localization usage document :https://pub.dev/packages/easy_localization#usage
      EasyLocalization(
          supportedLocales: const [Locale('en', 'US'), Locale('ar', 'OM')],
          path: 'assets/translations',
          fallbackLocale: const Locale('en', 'US'),
          useFallbackTranslations: true,
          child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppThemeCubit>(create: (context) => locate<AppThemeCubit>()),
          // TODO:Add Another global bloc/cubits
          ///This bloc can access all the widget tree
          ///to access [final someBloc = context.read<SomeBloc>();]
        ],
        child: BlocBuilder<AppThemeCubit, ThemeData>(
          builder: (context, state) {
            return MaterialApp.router(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              title: 'Sample Bloc Project',
              theme: state,
              locale: context.locale,
              builder: EasyLoading.init(),
              //TODO:here add more routes
              routerConfig: router,
            );
          },
        ));
  }
}
