import 'package:cerci_online/features/home/domain/entities/product_item.dart';
import 'package:cerci_online/features/home/domain/repositories/product_repository.dart';

class GetBestSellerProducts {
  final ProductRepository repository;
  GetBestSellerProducts(this.repository);

  Future<List<ProductItem>> call() {
    return repository.getBestSellerProducts();
  }
}
