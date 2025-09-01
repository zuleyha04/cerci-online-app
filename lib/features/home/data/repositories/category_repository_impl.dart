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

    return raw.map((e) => CategoryModel.fromMap(e).toEntity()).toList();
  }
}
