import 'package:cerci_online/features/product/domain/entities/product.dart';
import 'package:cerci_online/features/product/domain/repositories/product_repository.dart';

class GetBestSeller {
  final ProductRepository repository;
  GetBestSeller(this.repository);

  Future<List<Product>> call() async {
    return await repository.getBestSeller();
  }
}
