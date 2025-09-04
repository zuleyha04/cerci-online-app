import 'package:cerci_online/features/product/domain/entities/product.dart';

abstract class FavoriteRepository {
  Future<void> toggleFavorite(Product product);
  bool isFavorite(String productId);
  List<Product> getFavorites();
}
