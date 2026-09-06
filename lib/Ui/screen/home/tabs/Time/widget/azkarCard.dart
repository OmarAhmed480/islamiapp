import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/uitils/app_colors.dart';
import 'package:islami_app/uitils/app_style.dart';

class AzkarCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const AzkarCard({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 250.h,
        width: 185.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.gold,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            SizedBox(height: 15.h),
            Text(
              title,
              style: AppStyle.bold20wh,
            ),
          ],
        ),
      ),
    );
  }
}