import 'package:cerci_online/features/product/data/datasources/product_remote_data_source.dart';
import 'package:cerci_online/features/product/domain/entities/product.dart';
import 'package:cerci_online/features/product/domain/repositories/product_repository.dart';
import 'package:diacritic/diacritic.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDatasource;
  ProductRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<Product>> getProductList() async {
    final models = await remoteDatasource.getProductList();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<Product>> getBestSeller() async {
    final model = await remoteDatasource.getProductList();
    model.sort((a, b) => a.stock.compareTo(b.stock));
    return model.take(5).map((m) => m.toEntity()).toList();
  }

  @override
  Future<Product> getProductDetail(String id) async {
    final models = await remoteDatasource.getProductList();
    final model = models.singleWhere(
      (m) => m.id == id,
      orElse: () => throw Exception('Product not found'),
    );
    return model.toEntity();
  }

  @override
  Future<List<Product>> getProductsByCategory(String categoryId) async {
    final models = await remoteDatasource.getProductList();
    return models
        .where((m) => m.categoryId == categoryId)
        .map((m) => m.toEntity())
        .toList();
  }

  @override
  Future<List<Product>> searchProducts(String keyword) async {
    final allProducts = await remoteDatasource.getProductList();
    String normalize(String input) =>
        removeDiacritics(input.toLowerCase().trim());

    final normalizedKeyword = normalize(keyword);

    return allProducts
        .where(
          (p) =>
              normalize(p.name).contains(normalizedKeyword) ||
              normalize(p.categoryId).contains(normalizedKeyword),
        )
        .map((p) => p.toEntity())
        .toList();
  }
}
