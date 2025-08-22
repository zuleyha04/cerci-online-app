import 'package:cerci_online/features/home/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategories();
}
