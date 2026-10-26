import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/uitils/app_colors.dart';
import 'package:islami_app/uitils/app_style.dart';

class QuranVerseItem extends StatelessWidget {
  final String verse;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const QuranVerseItem({
    super.key,
    required this.verse,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: REdgeInsets.symmetric(horizontal: 10, vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.gold : Colors.transparent,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.gold, width: 1.w),
        ),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: verse,
                style: AppStyle.bold20Gold.copyWith(
                  height: 2,
                  color: isSelected ? AppColors.black : AppColors.gold,
                ),
              ),
              TextSpan(
                text: ' ﴿${index + 1}﴾',
                style: AppStyle.bold20Gold.copyWith(
                  fontSize: 18.sp,
                  color: isSelected ? AppColors.black : AppColors.gold,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
