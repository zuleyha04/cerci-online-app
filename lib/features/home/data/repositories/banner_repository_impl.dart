import 'package:cerci_online/features/home/data/datasources/banner_local_data_source.dart';
import 'package:cerci_online/features/home/domain/repositories/banner_repository.dart';
import '../../domain/entities/banner_item.dart';
import '../models/banner_item_model.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerLocalDataSource bannerLocalDataSource;
  BannerRepositoryImpl(this.bannerLocalDataSource);

  @override
  Future<List<BannerItem>> getBanners() async {
    final raw = await bannerLocalDataSource.getBanners();
    return raw.map<BannerItem>((e) => BannerItemModel.fromMap(e)).toList();
  }
}
