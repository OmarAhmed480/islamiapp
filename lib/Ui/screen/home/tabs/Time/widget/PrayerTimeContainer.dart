import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/Ui/screen/home/tabs/Time/widget/prayer_time_card.dart';
import 'package:islami_app/uitils/app_colors.dart';

class PrayerTimeContainer extends StatelessWidget {
  final String prayerName;
  final String prayerTime;

  const PrayerTimeContainer({
    super.key,
    required this.prayerName,
    required this.prayerTime,
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
          colors: [AppColors.black, AppColors.darkGold],
        ),
      ),
      child: PrayerTimeCard(prayerName: prayerName, prayerTime: prayerTime),
    );
  }
}
