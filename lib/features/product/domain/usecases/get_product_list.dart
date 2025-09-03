import 'package:cerci_online/features/product/domain/entities/product.dart';
import 'package:cerci_online/features/product/domain/repositories/product_repository.dart';

class GetProductList {
  final ProductRepository repository;
  GetProductList(this.repository);

  Future<List<Product>> call() async {
    return await repository.getProductList();
  }
}
