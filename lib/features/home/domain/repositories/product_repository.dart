import 'package:cerci_online/features/home/domain/entities/product_item.dart';

abstract class ProductRepository {
  Future<List<ProductItem>> getBestSellerProducts();
  Future<List<ProductItem>> getProductsByCategory(String categoryId);
}
