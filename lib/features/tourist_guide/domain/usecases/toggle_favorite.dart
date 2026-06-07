import '../../../../core/usecases/usecase.dart';
import '../repositories/tourist_site_repository.dart';

class ToggleFavorite implements UseCase<void, String> {
  final TouristSiteRepository repository;

  const ToggleFavorite(this.repository);

  @override
  Future<void> call(String siteId) async {
    return repository.toggleFavorite(siteId);
  }
}
