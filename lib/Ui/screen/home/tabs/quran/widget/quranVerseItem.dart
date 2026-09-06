import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/uitils/app_colors.dart';
import 'package:islami_app/uitils/app_style.dart';

class QuranVerseItem extends StatelessWidget {
  final String verse;
  int index;


  QuranVerseItem({super.key, required this.verse, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: REdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.gold, width: 1.w),
      ),
      child: Center(
        child: Text(
          " $verse [ ${index + 1} ]",
          style: AppStyle.bold20Gold,
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ),
    );
  }
}
