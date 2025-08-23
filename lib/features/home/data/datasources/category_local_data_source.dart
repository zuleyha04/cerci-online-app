import 'package:cerci_online/core/configs/assets/app_mock_paths.dart';
import 'package:cerci_online/core/utils/json_loader.dart';

class CategoryLocalDataSource {
  Future<List<Map<String, dynamic>>> getCategories() async {
    final raw = await JsonLoader.loadList(AppMockPaths.categories);
    return raw.map((e) => e as Map<String, dynamic>).toList();
  }
}
