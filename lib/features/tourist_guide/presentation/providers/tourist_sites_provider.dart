import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../di/injection.dart';
import '../../domain/entities/tourist_site.dart';
import '../../domain/usecases/get_tourist_sites.dart';
import '../../domain/usecases/toggle_favorite.dart';
import '../../../../core/usecases/usecase.dart';

enum TouristSiteFilter { allAZ, allZA, favorites }

class SortFilter extends Notifier<TouristSiteFilter> {
  @override
  TouristSiteFilter build() => TouristSiteFilter.allAZ;

  void set(TouristSiteFilter filter) => state = filter;
}

final sortFilterProvider =
    NotifierProvider<SortFilter, TouristSiteFilter>(SortFilter.new);

class TouristSitesNotifier extends AsyncNotifier<List<TouristSite>> {
  @override
  Future<List<TouristSite>> build() async {
    final getTouristSites = getIt<GetTouristSites>();
    return getTouristSites(const NoParams());
  }

  Future<void> toggleFavorite(String siteId) async {
    final sites = state.asData?.value;
    if (sites == null) return;

    final index = sites.indexWhere((s) => s.id == siteId);
    if (index == -1) return;

    final updated = List<TouristSite>.from(sites);
    updated[index] =
        sites[index].copyWith(isFavorite: !sites[index].isFavorite);
    state = AsyncData(updated);

    final toggleFavorite = getIt<ToggleFavorite>();
    toggleFavorite(siteId);
  }
}

final touristSitesProvider =
    AsyncNotifierProvider<TouristSitesNotifier, List<TouristSite>>(
  TouristSitesNotifier.new,
);

final filteredTouristSitesProvider =
    Provider<AsyncValue<List<TouristSite>>>((ref) {
  final filter = ref.watch(sortFilterProvider);
  final sitesAsync = ref.watch(touristSitesProvider);

  return sitesAsync.when(
    data: (sites) {
      switch (filter) {
        case TouristSiteFilter.allAZ:
          final sorted = List<TouristSite>.from(sites)
            ..sort((a, b) => a.name.compareTo(b.name));
          return AsyncData(sorted);
        case TouristSiteFilter.allZA:
          final sorted = List<TouristSite>.from(sites)
            ..sort((a, b) => b.name.compareTo(a.name));
          return AsyncData(sorted);
        case TouristSiteFilter.favorites:
          return AsyncData(sites.where((s) => s.isFavorite).toList());
      }
    },
    loading: () => const AsyncLoading(),
    error: (e, st) => AsyncError(e, st),
  );
});
