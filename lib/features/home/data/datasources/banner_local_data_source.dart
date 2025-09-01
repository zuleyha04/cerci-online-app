import 'package:cerci_online/core/configs/assets/app_mock_paths.dart';
import 'package:cerci_online/core/utils/json_loader.dart';

class BannerLocalDataSource {
  Future<List<Map<String, dynamic>>> getBanners() async {
    final raw = await JsonLoader.loadList(AppMockPaths.banners);
    return raw.cast<Map<String, dynamic>>();
  }
}
