import 'package:cerci_online/features/product/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProductList();
  Future<List<Product>> getBestSeller();
  Future<Product> getProductDetail(String id);
  Future<List<Product>> getProductsByCategory(String categoryId);
  Future<List<Product>> searchProducts(String keyword);
}
