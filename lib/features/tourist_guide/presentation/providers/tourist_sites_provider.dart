import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../di/injection.dart';
import '../../domain/entities/tourist_site.dart';
import '../../domain/usecases/get_tourist_sites.dart';
import '../../domain/usecases/toggle_favorite.dart';
import '../../../../core/usecases/usecase.dart';

class TouristSitesNotifier extends AsyncNotifier<List<TouristSite>> {
  @override
  Future<List<TouristSite>> build() async {
    final getTouristSites = getIt<GetTouristSites>();
    return getTouristSites(const NoParams());
  }

  Future<void> toggleFavorite(String siteId) async {
    final toggleFavorite = getIt<ToggleFavorite>();
    await toggleFavorite(siteId);

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final getTouristSites = getIt<GetTouristSites>();
      return getTouristSites(const NoParams());
    });
  }
}

final touristSitesProvider =
    AsyncNotifierProvider<TouristSitesNotifier, List<TouristSite>>(
  TouristSitesNotifier.new,
);
