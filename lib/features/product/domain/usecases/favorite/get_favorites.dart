import 'package:cerci_online/features/product/domain/entities/product.dart';
import 'package:cerci_online/features/product/domain/repositories/favorite_repository.dart';

class GetFavorites {
  final FavoriteRepository repository;
  GetFavorites(this.repository);

  List<Product> call() {
    return repository.getFavorites();
  }
}
