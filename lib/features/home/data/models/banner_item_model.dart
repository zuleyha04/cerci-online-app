import 'package:cerci_online/features/home/domain/entities/banner_item.dart';

class BannerItemModel extends BannerItem {
  BannerItemModel({
    required super.id,
    required super.imageUrl,
    required super.title,
    required super.deeplink,
  });

  factory BannerItemModel.fromMap(Map<String, dynamic> map) {
    return BannerItemModel(
      id: map['id'] as String,
      imageUrl: map['imageUrl'] as String,
      title: (map['title'] as String?) ?? '',
      deeplink: (map['deeplink'] as String?) ?? '',
    );
  }

  BannerItem toEntity() =>
      BannerItem(id: id, imageUrl: imageUrl, title: title, deeplink: deeplink);
}
