import 'package:cerci_online/core/configs/assets/app_mock_paths.dart';
import 'package:cerci_online/core/utils/json_loader.dart';
import 'package:cerci_online/features/home/data/datasources/product_local_data_source.dart';
import 'package:cerci_online/features/home/domain/repositories/product_repository.dart';
import '../../domain/entities/product_item.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource localDataSource;
  ProductRepositoryImpl(this.localDataSource);

  @override
  Future<List<ProductItem>> getBestSellerProducts() async {
    final raw = await JsonLoader.loadList(AppMockPaths.products);
    return raw
        .map<ProductItem>(
          (e) => ProductModel.fromMap(e as Map<String, dynamic>),
        )
        .where((p) => p.isBestSeller)
        .toList();
  }
}
