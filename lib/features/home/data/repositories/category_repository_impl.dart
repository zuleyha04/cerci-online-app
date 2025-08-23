import 'package:cerci_online/features/home/data/datasources/category_local_data_source.dart';
import 'package:cerci_online/features/home/data/models/category_model.dart';
import 'package:cerci_online/features/home/domain/entities/category_item.dart';
import 'package:cerci_online/features/home/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryLocalDataSource categoryLocalDataSource;

  CategoryRepositoryImpl(this.categoryLocalDataSource);

  @override
  Future<List<CategoryItem>> getCategories() async {
    final raw = await categoryLocalDataSource.getCategories();

    final list =
        raw.map<CategoryItem>((e) => CategoryModel.fromMap(e)).toList();
    list.sort((a, b) => a.order.compareTo(b.order));

    return list;
  }
}
