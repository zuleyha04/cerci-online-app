import 'package:cerci_online/features/product/domain/entities/product.dart';
import 'package:cerci_online/features/product/domain/repositories/product_repository.dart';

class GetProductDetail {
  final ProductRepository repository;
  GetProductDetail(this.repository);

  Future<Product> call(String id) async {
    return await repository.getProductDetail(id);
  }
}
