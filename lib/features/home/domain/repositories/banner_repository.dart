import 'package:cerci_online/features/home/domain/entities/banner_item.dart';

abstract class BannerRepository {
  Future<List<BannerItem>> getBanners();
}
