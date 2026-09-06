import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/uitils/app_assets.dart';
import 'package:islami_app/uitils/app_style.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int tasbeehIndex = 0;

  List<String> tasbeehList = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
          style: AppStyle.bold16w.copyWith(fontSize: 36.sp),
          textAlign: TextAlign.center,
        ),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(AppAssets.sebhaHeader, fit: BoxFit.fill),
            Padding(
              padding: EdgeInsets.only(top: 80.h),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    counter++;
                    if (counter == 33) {
                      counter = 0;
                      if (tasbeehIndex < tasbeehList.length - 1) {
                        tasbeehIndex++;
                      } else {
                        tasbeehIndex = 0;
                      }
                    }
                  });
                },
                child:Transform.rotate(

                   angle: counter / 33,
                  child: Image.asset(AppAssets.sebhaBody, fit: BoxFit.fill),
                ),
              ),
            ),
            Positioned(
              top: 250.h,
              child: Column(
                children: [
                  Text(tasbeehList[tasbeehIndex], style: AppStyle.bold16w),
                  Text(
                    "$counter",
                    style: AppStyle.bold16w,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
