import 'package:cerci_online/features/home/domain/entities/product_item.dart';

class ProductModel extends ProductItem {
  ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.imageUrl,
    required super.categoryId,
    required super.isBestSeller,
    required super.isFavorite,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    final rawPrice = map['price'];
    if (rawPrice is! num) {
      throw const FormatException('price must be a number');
    }
    final price = rawPrice.toDouble();
    if (price < 0) {
      throw const FormatException('price cannot be negative');
    }

    return ProductModel(
      id: map['id'] as String,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      categoryId: map['categoryId'] as String,
      price: price,
      isBestSeller: (map['isBestSeller'] as bool?) ?? false,
      isFavorite: (map['isFavorite'] as bool?) ?? false,
    );
  }

  ProductItem toEntity() => ProductItem(
    id: id,
    name: name,
    price: price,
    imageUrl: imageUrl,
    categoryId: categoryId,
    isBestSeller: isBestSeller,
    isFavorite: isFavorite,
  );
}
