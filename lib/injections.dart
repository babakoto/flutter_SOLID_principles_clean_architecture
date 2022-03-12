import 'package:clean_architecture/core/core.dart';
import 'package:clean_architecture/core/services/network/network.dart';
import 'package:clean_architecture/data/data.dart';
import 'package:clean_architecture/data/sources/local/local_source_imp.dart';
import 'package:clean_architecture/domain/domain.dart';
import 'package:clean_architecture/presentation/presentation.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

Future<void> init() async {
  // INIT BLOCS
  getIt.registerFactory(
      () => ItemBloc(findItemsUseCase: getIt(), findItemByIdUseCase: getIt()));

  //SERVICES REGISTER
  getIt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );

  getIt.registerLazySingleton<InternetInfo>(
      () => InternetInfoImp(checker: getIt()));

  getIt.registerLazySingleton<LocalSource>(() => LocalSourceImp());

  getIt.registerLazySingleton<ServerSource>(
      () => ServerSourceImp(client: http.Client()));

  //  REPOSITORIES REGISTER
  getIt.registerLazySingleton<ItemRepository>(() => ItemRepositoryImp(
      localSource: getIt<LocalSource>(),
      internetInfo: getIt(),
      server: getIt()));

  //  USE CASES REGISTER
  getIt.registerLazySingleton<FindItemsUseCase>(
      () => FindItemsUseCase(repository: getIt<ItemRepository>()));

  getIt.registerLazySingleton<FindItemById>(
      () => FindItemById(repository: getIt<ItemRepository>()));
}
