import '../../domain/entities/tourist_site.dart';
import '../../domain/repositories/tourist_site_repository.dart';
import '../datasources/tourist_site_local_datasource.dart';
import '../models/tourist_site_model.dart';

class TouristSiteRepositoryImpl implements TouristSiteRepository {
  final TouristSiteLocalDataSource _localDataSource;

  const TouristSiteRepositoryImpl(this._localDataSource);

  @override
  Future<List<TouristSite>> getTouristSites() async {
    final models = await _localDataSource.getTouristSites();
    return models.map((TouristSiteModel model) => model.toEntity()).toList();
  }

  @override
  Future<void> toggleFavorite(String siteId) async {
    await _localDataSource.toggleFavorite(siteId);
  }
}
