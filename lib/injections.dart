import 'package:clean_architecture/core/network/network.dart';
import 'package:clean_architecture/data/repositories/item_repository_imp.dart';
import 'package:clean_architecture/data/sources/local_source.dart';
import 'package:clean_architecture/data/sources/server_source.dart';
import 'package:clean_architecture/domain/repositories/item_repository.dart';
import 'package:clean_architecture/domain/usecase/find_items_usecase.dart';
import 'package:clean_architecture/presentation/bloc/item/item_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

Future<void> init() async {
  // INIT BLOCS
  getIt.registerFactory(() => ItemBloc(findItemsUseCase: getIt()));

  // INIT SERVICES
  getIt.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
  getIt.registerLazySingleton<Network>(() => NetworkImp(checker: getIt()));
  getIt.registerLazySingleton<LocalSource>(() => LocalSourceImp());
  getIt.registerLazySingleton<ServerSource>(
      () => ServerSourceImp(client: http.Client()));

  // INIT REPOSITORIES
  getIt.registerLazySingleton<ItemRepository>(() => ItemRepositoryImp(
      localSource: getIt<LocalSource>(), network: getIt(), server: getIt()));

  // INIT USE CASES
  getIt.registerLazySingleton<FindItemsUseCase>(
      () => FindItemsUseCase(repository: getIt<ItemRepository>()));
}
