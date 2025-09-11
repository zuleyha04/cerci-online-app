import 'package:cerci_online/features/cart/domain/entities/card_item.dart';

class CartItemModel {
  final String productId;
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;

  CartItemModel({
    required this.productId,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.quantity,
  });

  factory CartItemModel.fromMap(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json["id"],
      name: json["name"],
      price: (json["price"] as num).toDouble(),
      quantity: json["quantity"] ?? 1,
      imageUrl: json["imageUrl"],
    );
  }

  factory CartItemModel.fromEntity(CartItem entity) {
    return CartItemModel(
      productId: entity.productId,
      name: entity.name,
      price: entity.price,
      quantity: entity.quantity,
      imageUrl: entity.imageUrl,
    );
  }

  CartItem toEntity() => CartItem(
    productId: productId,
    name: name,
    price: price,
    quantity: quantity,
    imageUrl: imageUrl,
  );
}
