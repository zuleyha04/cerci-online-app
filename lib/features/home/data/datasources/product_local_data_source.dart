import 'package:cerci_online/core/configs/assets/app_mock_paths.dart';
import 'package:cerci_online/core/utils/json_loader.dart';

class ProductLocalDataSource {
  Future<List<Map<String, dynamic>>> getBestSellerProducts() async {
    final raw = await JsonLoader.loadList(AppMockPaths.products);
    return raw.cast<Map<String, dynamic>>();
  }
}
