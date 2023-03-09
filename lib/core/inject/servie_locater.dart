import 'package:api_2/core/utils/share/internet_connection.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/news/data/datasource/locale_datasource.dart';
import '../../features/news/data/datasource/remote_datasource.dart';
import '../../features/news/data/repository/news_repo_implement.dart';
import '../../features/news/domain/repository/news_repo.dart';
import '../../features/news/domain/usecases/news_usecase.dart';
import '../../features/news/screens/controller/news_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// bloc
  sl.registerFactory<NewsCubit>(() => NewsCubit(getNewsUseCase: sl()));

  /// UseCase
  sl.registerLazySingleton(() => GetNewsUseCase(newsRepo: sl()));

  /// Repository
  sl.registerLazySingleton<NewsRepo>(() => NewsRepoImplement(
      newsRemoteData: sl(), newsLocalDataSource: sl(), networkInfo: sl()));

  /// datasource
  sl.registerLazySingleton<NewsRemoteData>(() => NewsRemoteDataImplement());
  sl.registerLazySingleton<NewsLocalDataSource>(() => NewsLocalDataSourceImpl(
        sharedPreferences: sl(),
      ));

  /// core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplement(internetConnection: sl()));

  /// external
  /// external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
