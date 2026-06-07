import '../entities/tourist_site.dart';

abstract class TouristSiteRepository {
  Future<List<TouristSite>> getTouristSites();
  Future<void> toggleFavorite(String siteId);
}
