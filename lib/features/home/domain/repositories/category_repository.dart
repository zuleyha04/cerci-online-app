import 'package:cerci_online/features/home/domain/entities/category_item.dart';

abstract class CategoryRepository {
  Future<List<CategoryItem>> getCategories();
}
