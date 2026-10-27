import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/Ui/screen/home/tabs/Time/azkar_screen.dart';
import 'package:islami_app/Ui/screen/home/tabs/Time/widget/azkarCard.dart';
import 'package:islami_app/Ui/screen/home/tabs/Time/widget/prayer_times_section.dart';
import 'package:islami_app/Ui/screen/home/tabs/Time/widget/reusable_grid_view.dart';
import 'package:islami_app/Ui/widget/customErrorWidget.dart';
import 'package:islami_app/Ui/widget/customLoadingWidget.dart';
import 'package:islami_app/api/dio_manager.dart';
import 'package:islami_app/function/function.dart';
import 'package:islami_app/models/prayer_model/prayer_data_model.dart';
import 'package:islami_app/notification_service/notification_service.dart';
import 'package:islami_app/notification_service/notification_test_buttons.dart';
import 'package:islami_app/uitils/app_assets.dart';
import 'package:islami_app/uitils/app_style.dart';

class TimeTab extends StatefulWidget {
  const TimeTab({super.key});

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> with WidgetsBindingObserver {

  late Future<PrayerDataModel> prayerDataFuture;

  Timer? countdownTimer;
  Duration countdown = Duration.zero;
  Map<String, dynamic> currentPrayerTimings = {};

  bool isSoundEnabled = true;
  bool notificationsScheduled = false;
  bool isScheduling = false;

  final List<Map<String, String>> azkarCategories = [
    {
      'title': 'Quranic Supplications',
      'type': 'أدعية قرآنية',
      'image': AppAssets.documentIcon1,
    },
    {
      'title': 'Prophets Supplications',
      'type': 'أدعية الأنبياء',
      'image': AppAssets.documentIcon2,
    },
    {
      'title': 'Evening Azkar',
      'type': 'أذكار المساء',
      'image': AppAssets.bellIcon,
    },
    {
      'title': 'After Prayer Azkar',
      'type': 'أذكار بعد السلام من الصلاة المفروضة',
      'image': AppAssets.documentIcon1,
    },
    {
      'title': 'Tasbeeh',
      'type': 'تسابيح',
      'image': AppAssets.commentBubbleIcon,
    },
    {
      'title': 'Sleeping Azkar',
      'type': 'أذكار النوم',
      'image': AppAssets.documentIcon2,
    },
    {
      'title': 'Waking Up Azkar',
      'type': 'أذكار الاستيقاظ',
      'image': AppAssets.documentIcon1,
    },
    {
      'title': 'Morning Azkar',
      'type': 'أذكار الصباح',
      'image': AppAssets.bellIcon,
    },
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    prayerDataFuture = DioManager.getPrayerData();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && isSoundEnabled) {
      retryPrayerData();
    }
  }

  void retryPrayerData() {
    if (!mounted) return;

    setState(() {
      prayerDataFuture = DioManager.getPrayerData();
      notificationsScheduled = false;
    });
  }

  void startCountdown() {
    countdownTimer?.cancel();

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted || currentPrayerTimings.isEmpty) return;

      setState(() {
        countdown = PrayerTime.getNextPrayerCountDown(currentPrayerTimings);
      });
    });
  }

  Future<void> schedulePrayerNotifications(
    Map<String, dynamic> prayerTimings,
  ) async {
    if (!isSoundEnabled || isScheduling || notificationsScheduled) {
      return;
    }
    isScheduling = true;
    try {
      await NotificationService.instance.scheduleAllPrayerNotifications(
        prayerTimings: prayerTimings,
      );
      notificationsScheduled = true;
      debugPrint('تمت جدولة إشعارات الصلاة بنجاح');
    } catch (e, stackTrace) {
      notificationsScheduled = false;
      debugPrint('خطأ في جدولة إشعارات الصلاة: $e');
      debugPrint('$stackTrace');
    } finally {
      isScheduling = false;
    }
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> togglePrayerNotifications() async {
    final newValue = !isSoundEnabled;

    setState(() {
      isSoundEnabled = newValue;
    });

    try {
      if (!newValue) {
        await NotificationService.instance.setPrayerNotificationsEnabled(
          enabled: false,
          prayerTimings: currentPrayerTimings,
        );

        if (!mounted) return;

        setState(() {
          notificationsScheduled = false;
        });

        debugPrint('تم إيقاف إشعارات الصلاة');
        return;
      }

      if (currentPrayerTimings.isNotEmpty) {
        await NotificationService.instance.setPrayerNotificationsEnabled(
          enabled: true,
          prayerTimings: currentPrayerTimings,
        );

        if (!mounted) return;

        setState(() {
          notificationsScheduled = true;
        });

        debugPrint('تم تفعيل إشعارات الصلاة');
      }
    } catch (e, stackTrace) {
      debugPrint('خطأ في تغيير حالة إشعارات الصلاة: $e');
      debugPrint('$stackTrace');

      if (!mounted) return;

      setState(() {
        notificationsScheduled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<PrayerDataModel>(
              future: prayerDataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CustomLoadingWidget();
                }

                if (snapshot.hasError) {
                  return CustomErrorWidget(
                    error: snapshot.error.toString(),
                    onRetry: retryPrayerData,
                  );
                }

                if (!snapshot.hasData || snapshot.data!.timings == null) {
                  return CustomErrorWidget(
                    error: 'No prayer data available',
                    onRetry: retryPrayerData,
                  );
                }

                final PrayerDataModel data = snapshot.data!;

                final Map<String, dynamic> prayerTimings = {
                  'Fajr': data.timings!.fajr ?? '--:--',
                  'Sunrise': data.timings!.sunrise ?? '--:--',
                  'Dhuhr': data.timings!.dhuhr ?? '--:--',
                  'Asr': data.timings!.asr ?? '--:--',
                  'Maghrib': data.timings!.maghrib ?? '--:--',
                  'Isha': data.timings!.isha ?? '--:--',
                };

                currentPrayerTimings = prayerTimings;

                if (countdownTimer == null) {
                  countdown = PrayerTime.getNextPrayerCountDown(prayerTimings);
                  startCountdown();
                }

                if (isSoundEnabled &&
                    !notificationsScheduled &&
                    !isScheduling) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (!mounted || !isSoundEnabled) return;
                    schedulePrayerNotifications(prayerTimings);
                  });
                }

                return PrayerTimesSection(
                  prayerData: data,
                  countdown: countdown,
                  isSoundEnabled: isSoundEnabled,
                  onTogglePrayerNotifications: togglePrayerNotifications,
                );
              },
            ),
            NotificationTestButtons(),
            SizedBox(height: 10.h),

            Text('Azkar', style: AppStyle.bold16w),

            SizedBox(height: 10.h),
            ReusableGridView(
              itemCount: azkarCategories.length,
              childAspectRatio: 0.68,
              itemBuilder: (context, index) {
                final category = azkarCategories[index];
                return AzkarCard(
                  image: category['image']!,
                  title: category['title']!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AzkarScreen(azkarType: category['type']!),
                      ),
                    );
                  },
                );
              },
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
