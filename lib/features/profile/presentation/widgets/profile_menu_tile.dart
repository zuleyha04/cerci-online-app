import 'package:cerci_online/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMenuTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const ProfileMenuTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primary,
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        title: Text(title, style: TextStyle(fontSize: 14.sp)),
        trailing: Icon(Icons.arrow_forward_ios, size: 14.sp),
        onTap: onTap,
      ),
    );
  }
}
