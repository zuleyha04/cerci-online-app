import 'package:cerci_online/features/cart/domain/repositories/cart_repository.dart';

class GetTotalQuantity {
  final CartRepository repository;
  GetTotalQuantity(this.repository);

  Future<int> call() {
    return repository.getTotalQuantity();
  }
}
