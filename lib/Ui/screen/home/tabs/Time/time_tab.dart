import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/Ui/screen/home/tabs/Time/widget/azkarCard.dart';
import 'package:islami_app/Ui/screen/home/tabs/Time/widget/prayerCard.dart';
import 'package:islami_app/Ui/screen/home/tabs/Time/widget/prayerDateHeader.dart';
import 'package:islami_app/models/prayerModel.dart';
import 'package:islami_app/uitils/app_assets.dart';
import 'package:islami_app/uitils/app_colors.dart';
import 'package:islami_app/uitils/app_style.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 15.h),
              decoration: BoxDecoration(
                color: AppColors.bronze,
                borderRadius: BorderRadius.circular(40.r),
                image: DecorationImage(
                  image: AssetImage(AppAssets.prayTime),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  PrayerDateHeader(
                    date: "16 Jul,\n2024",
                    title: "Pray Time\nTuesday",
                    hijriDate: "09 Muh,\n1446",
                  ),

                  SizedBox(height: 15.h),

                  CarouselSlider(
                    items: PrayerModel.prayers.map((prayer) {
                      return PrayerCard(prayer: prayer);
                    }).toList(),
                    options: CarouselOptions(
                      height: 150.h,
                      viewportFraction: .30,
                      enlargeCenterPage: true,
                      enlargeFactor: .3,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Next Pray - ",
                        style: AppStyle.bold16w.copyWith(
                          color: AppColors.black70,
                        ),
                      ),
                      Text(
                        "02:32",
                        style: AppStyle.bold16w.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(width: 30.w),
                      Image.asset(AppAssets.volumeSlash),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),

            Text("Azkar", style: AppStyle.bold16w),

            SizedBox(height: 10.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AzkarCard(
                  image: AppAssets.bellIcon,
                  title: "Evening Azkar",
                  onTap: () {
                    // Navigate
                  },
                ),
                AzkarCard(
                  image: AppAssets.commentBubbleIcon,
                  title: "Morning Azkar",
                  onTap: () {
                    // Navigate
                  },
                ),
              ],
            ),

            SizedBox(height: 10.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AzkarCard(
                  image: AppAssets.documentIcon1,
                  title: "Waking Azkar",
                  onTap: () {
                    // Navigate
                  },
                ),
                AzkarCard(
                  image: AppAssets.documentIcon2,
                  title: "Sleeping Azkar",
                  onTap: () {
                    // Navigate
                  },
                ),
              ],
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
