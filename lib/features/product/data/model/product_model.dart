import '../../domain/entities/product.dart';

class ProductModel {
  final String id;
  final String name;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final String categoryId;
  final String? description;
  final int stock;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    this.oldPrice,
    required this.imageUrl,
    required this.categoryId,
    this.description,
    required this.stock,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    final rawPrice = map['price'];
    if (rawPrice is! num) throw const FormatException('price must be a number');
    final price = rawPrice.toDouble();
    if (price < 0) throw const FormatException('price cannot be negative');

    final rawStock = map['stock'];
    if (rawStock is! num) throw const FormatException('stock must be a number');
    final stock = rawStock.toInt();
    if (stock < 0) throw const FormatException('stock cannot be negative');

    return ProductModel(
      id:
          map['id']?.toString() ??
          (throw const FormatException('id is required')),
      name:
          map['name']?.toString() ??
          (throw const FormatException('name is required')),
      price: price,
      oldPrice: (map['oldPrice'] as num?)?.toDouble(),
      imageUrl:
          map['imageUrl']?.toString() ??
          (throw const FormatException('imageUrl is required')),
      categoryId:
          map['categoryId']?.toString() ??
          (throw const FormatException('categoryId is required')),
      description: map['description']?.toString(),
      stock: stock,
    );
  }

  Product toEntity() => Product(
    id: id,
    name: name,
    price: price,
    oldPrice: oldPrice,
    imageUrl: imageUrl,
    categoryId: categoryId,
    description: description,
    stock: stock,
  );
}
