import 'package:cerci_online/features/product/domain/repositories/favorite_repository.dart';

class IsFavorite {
  final FavoriteRepository repository;
  IsFavorite(this.repository);

  bool call(String productId) {
    return repository.isFavorite(productId);
  }
}
