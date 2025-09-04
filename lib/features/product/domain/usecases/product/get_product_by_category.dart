import 'package:cerci_online/features/product/domain/entities/product.dart';
import 'package:cerci_online/features/product/domain/repositories/product_repository.dart';

class GetProductByCategory {
  final ProductRepository repository;
  GetProductByCategory(this.repository);

  Future<List<Product>> call(String categoryId) async {
    return await repository.getProductsByCategory(categoryId);
  }
}
