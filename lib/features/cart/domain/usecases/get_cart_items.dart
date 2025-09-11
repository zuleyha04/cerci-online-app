import 'package:cerci_online/features/cart/domain/entities/card_item.dart';
import 'package:cerci_online/features/cart/domain/repositories/cart_repository.dart';

class GetCartItems {
  final CartRepository repository;
  GetCartItems(this.repository);

  Future<List<CartItem>> call() {
    return repository.getCartItems();
  }
}
