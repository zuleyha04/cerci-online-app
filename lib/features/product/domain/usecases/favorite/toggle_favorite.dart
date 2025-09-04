import 'package:cerci_online/features/product/domain/entities/product.dart';
import 'package:cerci_online/features/product/domain/repositories/favorite_repository.dart';

class ToggleFavorite {
  final FavoriteRepository repository;
  ToggleFavorite(this.repository);

  Future<void> call(Product product) {
    return repository.toggleFavorite(product);
  }
}
