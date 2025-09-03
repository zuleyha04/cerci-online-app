import 'package:cerci_online/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImageSection extends StatelessWidget {
  final String imageUrl;
  const ProductImageSection({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imageUrl,
          height: 300.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.7),
            child: IconButton(
              icon: Icon(Icons.favorite_border, color: AppColors.textPrimary),
              //TODO: daha sonra düzenlenecek
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
