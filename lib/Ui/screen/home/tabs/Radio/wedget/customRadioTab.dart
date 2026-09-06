import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/uitils/app_colors.dart';
import 'package:islami_app/uitils/app_style.dart';

class CustomRadioTab extends StatelessWidget {
  final String title;
  final bool isSelected;


  const CustomRadioTab({
    super.key,
    required this.title,
    required this.isSelected,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: isSelected
            ? AppColors.gold
            : AppColors.black70,
      ),
      height: 40.h,
      width: 185.w,
      child: Text(
        title,
        style: isSelected
            ? AppStyle.bold16w.copyWith(
          color: AppColors.black,
        )
            : AppStyle.bold16w,
      ),
    );
  }
}