import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/Ui/screen/home/tabs/Time/widget/PrayerTimeContainer.dart';
import 'package:islami_app/Ui/screen/home/tabs/Time/widget/prayerDateHeader.dart';
import 'package:islami_app/models/prayer_model/prayer_data_model.dart';
import 'package:islami_app/function/function.dart';
import 'package:islami_app/uitils/app_assets.dart';
import 'package:islami_app/uitils/app_colors.dart';
import 'package:islami_app/uitils/app_style.dart';


class PrayerTimesSection extends StatelessWidget {
  final PrayerDataModel prayerData;
  final Duration countdown;
  final bool isSoundEnabled;
  final VoidCallback onTogglePrayerNotifications;

  const PrayerTimesSection({
    super.key,
    required this.prayerData,
    required this.countdown,
    required this.isSoundEnabled,
    required this.onTogglePrayerNotifications,
  });

  @override
  Widget build(BuildContext context) {
    final timings = prayerData.timings;

    if (timings == null) {
      return const Center(child: Text('No prayer data available'));
    }

    final Map<String, dynamic> prayerTimings = {
      'Fajr': timings.fajr ?? '--:--',
      'Sunrise': timings.sunrise ?? '--:--',
      'Dhuhr': timings.dhuhr ?? '--:--',
      'Asr': timings.asr ?? '--:--',
      'Maghrib': timings.maghrib ?? '--:--',
      'Isha': timings.isha ?? '--:--',
    };

    final sortedPrayerTimes = PrayerTime.sortPrayerTimes(prayerTimings);

    final nextPrayer = PrayerTime.getNextPrayer(prayerTimings);

    return Container(
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
            date: DateFormatter.fromGregorianDate(prayerData.date!.gregorian!),
            title: 'Pray Time\n${prayerData.date!.gregorian!.weekday!.en}',
            hijriDate: DateFormatter.fromHijriDate(prayerData.date!.hijri!),
          ),

          SizedBox(height: 15.h),

          CarouselSlider(
            items: sortedPrayerTimes.entries.map((prayer) {
              return PrayerTimeContainer(
                prayerName: prayer.key,
                prayerTime: prayer.value,
              );
            }).toList(),
            options: CarouselOptions(
              height: 150.h,
              viewportFraction: .30,
              enlargeCenterPage: true,
              enlargeFactor: .3,
              autoPlay: true,
            ),
          ),

          SizedBox(height: 10.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Next Pray - ',
                style: AppStyle.bold16w.copyWith(color: AppColors.black70),
              ),

              Text(
                '${nextPrayer.key} - '
                '${countdown.inHours.toString().padLeft(2, '0')}:'
                '${countdown.inMinutes.remainder(60).toString().padLeft(2, '0')}:'
                '${countdown.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                style: AppStyle.bold16w.copyWith(color: AppColors.black),
              ),

              SizedBox(width: 20.w),

              IconButton(
                onPressed: onTogglePrayerNotifications,
                icon: Icon(
                  isSoundEnabled ? Icons.volume_up : Icons.volume_off,
                  color: AppColors.black,
                  size: 35.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
