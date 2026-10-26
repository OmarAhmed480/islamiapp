import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/function/function.dart';
import 'package:islami_app/uitils/app_style.dart';

class PrayerTimeCard extends StatelessWidget {
  final String prayerName;
  final String prayerTime;

  const PrayerTimeCard({
    super.key,
    required this.prayerName,
    required this.prayerTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(prayerName, style: AppStyle.bold16w),
        SizedBox(height: 10.h),
        Text(
          TimeConvert.to12Hour(prayerTime),
          style: AppStyle.bold16w.copyWith(fontSize: 24.sp),
        ),
      ],
    );
  }
}
