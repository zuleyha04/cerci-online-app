import 'package:cerci_online/features/home/domain/entities/category_item.dart';

class CategoryModel extends CategoryItem {
  CategoryModel({
    required super.id,
    required super.name,
    required super.iconUrl,
    required super.order,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String,
      name: map['name'] as String,
      iconUrl: (map['iconUrl'] as String?) ?? '',
      order: (map['order'] as num?)?.toInt() ?? 0,
    );
  }
}
