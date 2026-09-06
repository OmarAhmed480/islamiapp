import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/uitils/app_style.dart';

class PrayerDateHeader extends StatelessWidget {
  final String date;
  final String title;
  final String hijriDate;

  const PrayerDateHeader({
    super.key,
    required this.date,
    required this.title,
    required this.hijriDate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            date,
            style: AppStyle.bold16w,
            textAlign: TextAlign.start,
          ),

          Text(
            title,
            style: AppStyle.bold20bl,
            textAlign: TextAlign.center,
          ),

          Text(
            hijriDate,
            style: AppStyle.bold16w,
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}