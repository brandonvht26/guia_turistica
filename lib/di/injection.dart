import 'package:get_it/get_it.dart';
import '../features/tourist_guide/data/datasources/tourist_site_local_datasource.dart';
import '../features/tourist_guide/data/repositories/tourist_site_repository_impl.dart';
import '../features/tourist_guide/domain/repositories/tourist_site_repository.dart';
import '../features/tourist_guide/domain/usecases/get_tourist_sites.dart';
import '../features/tourist_guide/domain/usecases/toggle_favorite.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // DataSources
  getIt.registerLazySingleton<TouristSiteLocalDataSource>(
    () => TouristSiteLocalDataSource(),
  );

  // Repositories
  getIt.registerLazySingleton<TouristSiteRepository>(
    () => TouristSiteRepositoryImpl(getIt<TouristSiteLocalDataSource>()),
  );

  // UseCases
  getIt.registerLazySingleton<GetTouristSites>(
    () => GetTouristSites(getIt<TouristSiteRepository>()),
  );

  getIt.registerLazySingleton<ToggleFavorite>(
    () => ToggleFavorite(getIt<TouristSiteRepository>()),
  );
}
