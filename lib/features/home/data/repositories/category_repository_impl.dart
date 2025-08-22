import 'package:cerci_online/core/configs/assets/app_mock_paths.dart';
import 'package:cerci_online/core/utils/json_loader.dart';
import 'package:cerci_online/features/home/data/models/category_model.dart';
import 'package:cerci_online/features/home/domain/entities/category.dart';
import 'package:cerci_online/features/home/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<List<Category>> getCategories() async {
    final raw = await JsonLoader.loadList(AppMockPaths.categories);
    final list =
        raw
            .map<Category>(
              (e) => CategoryModel.fromMap(e as Map<String, dynamic>),
            )
            .toList();
    list.sort((a, b) => a.order.compareTo(b.order));
    return list;
  }
}
