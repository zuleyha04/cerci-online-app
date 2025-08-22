import 'package:cerci_online/features/home/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getBestSellerProducts({int limit});
}
