import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:islami_app/uitils/app_colors.dart';
import 'package:islami_app/uitils/app_style.dart';

class MostRecentCard extends StatelessWidget {
  final String title;
  final String arabicTitle;
  final String verses;
  final String image;
  final VoidCallback onTap;

  const MostRecentCard({
    super.key,
    required this.title,
    required this.arabicTitle,
    required this.verses,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: REdgeInsets.only(right: 10.w),
        child: Container(
          height: 150.h,
          width: 300.w,
          decoration: BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: REdgeInsets.only(
              right: 25.w,
              left: 25.w,
              top: 12.h,
              bottom: 20.h,
          ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.bold20bl,
                      ),
                      SizedBox(height:10.h),

                      Text(
                        arabicTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.bold24bl,
                      ),

                      SizedBox(height:6.h),
                      Text(verses, style: AppStyle.bold14bl),
                    ],
                  ),
                ),
                Image.asset(
                  image,
                  width: 120.w,
                  height: 136.h,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
