import 'package:cerci_online/features/product/domain/entities/product.dart';
import 'package:cerci_online/features/product/domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImpl extends FavoriteRepository {
  final List<Product> _favorites = [];
  @override
  List<Product> getFavorites() {
    return List.unmodifiable(_favorites);
  }

  @override
  bool isFavorite(String productId) {
    return _favorites.any((p) => p.id == productId);
  }

  @override
  Future<void> toggleFavorite(Product product) async {
    if (isFavorite(product.id)) {
      _favorites.removeWhere((p) => p.id == product.id);
    } else {
      _favorites.add(product);
    }
  }
}
