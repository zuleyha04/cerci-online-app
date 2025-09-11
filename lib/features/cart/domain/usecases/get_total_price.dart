import 'package:cerci_online/features/cart/domain/repositories/cart_repository.dart';

class GetTotalPrice {
  final CartRepository repository;
  GetTotalPrice(this.repository);

  Future<double> call() {
    return repository.getTotalPrice();
  }
}
