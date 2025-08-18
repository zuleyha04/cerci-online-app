import 'package:cerci_online/features/home/domain/entities/banner_item.dart';
import 'package:cerci_online/features/home/domain/entities/category.dart';
import 'package:cerci_online/features/home/domain/entities/product.dart';

abstract class HomeRepository {
  Future<List<BannerItem>> getBanners();
  Future<List<Category>> getCategories();
  Future<List<Product>> getBestSellerProducts({int limit});
}
