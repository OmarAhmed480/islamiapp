import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/uitils/app_colors.dart';
import 'package:islami_app/uitils/app_style.dart';

class VersesWidget extends StatelessWidget {
  final List<String> verses;

  const VersesWidget({super.key, required this.verses});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: verses.isEmpty
          ? Center(child: CircularProgressIndicator(color: AppColors.gold))
          : SingleChildScrollView(
              padding: REdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Text(
                verses
                    .asMap()
                    .entries
                    .map((entry) {
                      final verseIndex = entry.key;
                      final verse = entry.value;

                      return '$verse ﴿${verseIndex + 1}﴾';
                    })
                    .join(' '),
                style: AppStyle.bold20Gold.copyWith(height: 2),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            ),
    );
  }
}
