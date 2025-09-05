import 'package:cerci_online/features/product/domain/entities/product.dart';
import 'package:cerci_online/features/product/domain/repositories/product_repository.dart';

class SearchProducts {
  final ProductRepository repository;
  SearchProducts(this.repository);

  Future<List<Product>> call(String keyword) {
    return repository.searchProducts(keyword);
  }
}
