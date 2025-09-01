import 'package:cerci_online/features/home/domain/entities/category_item.dart';
import 'package:cerci_online/features/home/domain/repositories/category_repository.dart';

class GetCategories {
  final CategoryRepository repository;
  GetCategories(this.repository);

  Future<List<CategoryItem>> call() async {
    final categories = await repository.getCategories();
    categories.sort((a, b) => a.order.compareTo(b.order));

    return categories;
  }
}
