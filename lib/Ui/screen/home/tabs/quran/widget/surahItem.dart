import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:islami_app/uitils/app_assets.dart';
import 'package:islami_app/uitils/app_colors.dart';
import 'package:islami_app/uitils/app_style.dart';

class SurahItem extends StatelessWidget {
  final int number;
  final String englishName;
  final String arabicName;
  final String verses;
  final VoidCallback  onTap;


  const SurahItem({
    super.key,
    required this.number,
    required this.englishName,
    required this.arabicName,
    required this.verses,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(AppAssets.vector, height: 53.h, width: 53.w),
                  Text("${number+1}".toString(), style: AppStyle.bold20wh),
                ],
              ),

              SizedBox(width: 10.w),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(englishName, style: AppStyle.bold16w),
                  SizedBox(height: 10.h),
                  Text("$verses Verses", style: AppStyle.bold16w),
                ],
              ),

              const Spacer(),

              Text(arabicName, style: AppStyle.bold16w),
            ],
          ),

          SizedBox(height: 15.h),

          Container(width: double.infinity, height: 1.h, color: AppColors.white),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}
