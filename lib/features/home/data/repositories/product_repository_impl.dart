import 'package:cerci_online/core/configs/assets/app_mock_paths.dart';
import 'package:cerci_online/core/utils/json_loader.dart';
import 'package:cerci_online/features/home/domain/repositories/product_repository.dart';
import '../../domain/entities/product.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Product>> getBestSellerProducts({int limit = 3}) async {
    final safe = limit <= 0 ? 3 : limit;
    final raw = await JsonLoader.loadList(AppMockPaths.products);
    return raw
        .map<Product>((e) => ProductModel.fromMap(e as Map<String, dynamic>))
        .where((p) => p.isBestSeller)
        .take(safe)
        .toList();
  }
}
