import 'package:carousel_slider/carousel_slider.dart';
import 'package:cerci_online/features/home/domain/entities/banner_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerSlider extends StatelessWidget {
  final List<BannerItem> banners;
  const BannerSlider({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180.h,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        enableInfiniteScroll: true,
      ),
      items:
          banners.map((banner) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12.h),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(banner.imageUrl, fit: BoxFit.cover),
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text(
                      banner.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }
}
