class ProductItem {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String categoryId;
  final bool isBestSeller;
  final bool isFavorite;

  const ProductItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
    required this.isBestSeller,
    required this.isFavorite,
  });
}
