import 'package:cerci_online/features/home/domain/entities/product_item.dart';
import 'package:cerci_online/features/home/domain/repositories/product_repository.dart';

class GetProductsByCategory {
  final ProductRepository repository;
  GetProductsByCategory(this.repository);

  Future<List<ProductItem>> call(String categoryId) async {
    return await repository.getProductsByCategory(categoryId);
  }
}
