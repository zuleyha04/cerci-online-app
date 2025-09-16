import 'package:cerci_online/core/configs/assets/app_mock_paths.dart';
import 'package:cerci_online/core/utils/json_loader.dart';
import 'package:cerci_online/features/product/data/model/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProductList();
}

class ProductRemoteDataSourceMock implements ProductRemoteDataSource {
  ProductRemoteDataSourceMock();

  @override
  Future<List<ProductModel>> getProductList() async {
    final productsRaw = await JsonLoader.loadList(AppMockPaths.products);
    return productsRaw
        .cast<Map<String, dynamic>>()
        .map((map) => ProductModel.fromMap(map))
        .toList();
  }
}
