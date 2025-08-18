import 'package:cerci_online/core/configs/assets/app_mock_paths.dart';
import 'package:cerci_online/core/utils/json_loader.dart';
import 'package:cerci_online/features/home/data/models/category_model.dart';
import 'package:cerci_online/features/home/domain/entities/category.dart';
import '../../domain/entities/banner_item.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/home_repository.dart';
import '../models/banner_item_model.dart';
import '../models/product_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<BannerItem>> getBanners() async {
    final raw = await JsonLoader.loadList(AppMockPaths.banners);
    return raw
        .map<BannerItem>(
          (e) => BannerItemModel.fromMap(e as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<List<Category>> getCategories() async {
    final raw = await JsonLoader.loadList(AppMockPaths.categories);
    final list =
        raw
            .map<Category>(
              (e) => CategoryModel.fromMap(e as Map<String, dynamic>),
            )
            .toList();
    list.sort((a, b) => a.order.compareTo(b.order));
    return list;
  }

  @override
  Future<List<Product>> getBestSellerProducts({int limit = 3}) async {
    final safe = limit <= 0 ? 3 : limit;
    final raw = await JsonLoader.loadList(AppMockPaths.products);
    return raw
        .map<Product>((e) => ProductModel.fromMap(e as Map<String, dynamic>))
        .where((p) => p.isBestSeller)
        .take(safe)
        .toList();
  }
}
