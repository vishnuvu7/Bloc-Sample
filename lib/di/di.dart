import 'package:bloc_sample/features/anime/cubit/anime_cubit.dart';
import 'package:bloc_sample/features/anime/repo/anime_repo.dart';
import 'package:bloc_sample/service/api_client.dart';
import 'package:bloc_sample/service/api_provider.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initializeDependencyInjection() {

  getIt.registerLazySingleton(() => ApiClient());
  getIt.registerLazySingleton(() => ApiHelper(locate<ApiClient>()));

  getIt.registerFactory(() => AnimeRepo(locate<ApiHelper>()));
  getIt.registerFactory(() => AnimeCubit(locate<AnimeRepo>()));

}

locate<T extends Object>({String? instanceName}) =>
    instanceName == null ? getIt.get<T>() : getIt.get<T>(instanceName: instanceName);

