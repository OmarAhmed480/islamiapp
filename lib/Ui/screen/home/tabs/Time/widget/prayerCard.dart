import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/models/prayerModel.dart';
import 'package:islami_app/uitils/app_colors.dart';
import 'package:islami_app/uitils/app_style.dart';

class PrayerCard extends StatelessWidget {
  final PrayerModel prayer;

  const PrayerCard({
    super.key,
    required this.prayer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104.w,
      height: 115.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.black,
            AppColors.darkGold,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            prayer.name,
            style: AppStyle.bold16w,
          ),
          Text(
            prayer.time,
            style: AppStyle.bold20bl.copyWith(
              fontSize: 32.sp,
              color: AppColors.white,
            ),
          ),
          Text(
            prayer.amPm,
            style: AppStyle.bold16w,
          ),
        ],
      ),
    );
  }
}