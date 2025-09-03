class Product {
  final String id;
  final String name;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final String categoryId;
  final String? description;
  final int stock;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
    this.oldPrice,
    this.description,
    required this.stock,
  });
}
