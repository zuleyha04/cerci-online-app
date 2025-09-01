import 'package:cerci_online/features/home/data/datasources/product_local_data_source.dart';
import 'package:cerci_online/features/home/domain/repositories/product_repository.dart';
import '../../domain/entities/product_item.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource localDataSource;
  ProductRepositoryImpl(this.localDataSource);

  @override
  Future<List<ProductItem>> getBestSellerProducts() async {
    final raw = await localDataSource.getProducts();
    final allProducts =
        raw
            .map<ProductItem>((e) => ProductModel.fromMap(e).toEntity())
            .toList();
    return allProducts.where((p) => p.isBestSeller).toList();
  }

  @override
  Future<List<ProductItem>> getProductsByCategory(String categoryId) async {
    final raw = await localDataSource.getProducts();
    final allProducts =
        raw
            .map<ProductItem>((e) => ProductModel.fromMap(e).toEntity())
            .toList();
    return allProducts.where((p) => p.categoryId == categoryId).toList();
  }
}
