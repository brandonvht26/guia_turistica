import '../../../../core/usecases/usecase.dart';
import '../entities/tourist_site.dart';
import '../repositories/tourist_site_repository.dart';

class GetTouristSites implements UseCase<List<TouristSite>, NoParams> {
  final TouristSiteRepository repository;

  const GetTouristSites(this.repository);

  @override
  Future<List<TouristSite>> call(NoParams params) async {
    return repository.getTouristSites();
  }
}
