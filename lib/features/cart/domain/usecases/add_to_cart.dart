import 'package:cerci_online/features/cart/domain/entities/card_item.dart';
import 'package:cerci_online/features/cart/domain/repositories/cart_repository.dart';

class AddToCart {
  final CartRepository repository;
  AddToCart(this.repository);

  Future<void> call(CartItem item) {
    return repository.addToCart(item);
  }
}
