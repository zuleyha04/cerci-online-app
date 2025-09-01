import 'package:cerci_online/features/home/domain/entities/banner_item.dart';
import 'package:cerci_online/features/home/domain/repositories/banner_repository.dart';

class GetBanners {
  final BannerRepository repository;
  GetBanners(this.repository);

  Future<List<BannerItem>> call() {
    return repository.getBanners();
  }
}
