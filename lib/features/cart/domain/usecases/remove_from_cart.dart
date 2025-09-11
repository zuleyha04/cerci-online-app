import 'package:cerci_online/features/cart/domain/repositories/cart_repository.dart';

class RemoveFromCart {
  final CartRepository repository;
  RemoveFromCart(this.repository);

  Future<void> call(String productId) {
    return repository.removeFromCart(productId);
  }
}
