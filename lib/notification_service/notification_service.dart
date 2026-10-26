import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'package:islami_app/notification_service/adhan_player_service.dart';

class NotificationService {
  NotificationService._();

  static final NotificationService instance = NotificationService._();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  bool _isScheduling = false;

  Future<void> initialize() async {
    tz.initializeTimeZones();

    final timezoneInfo = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timezoneInfo.identifier));

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const settings = InitializationSettings(android: androidSettings);

    await _notifications.initialize(settings: settings);

    final androidPlugin = _notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    await androidPlugin?.requestNotificationsPermission();

    final canScheduleExact = await androidPlugin
        ?.canScheduleExactNotifications();

    debugPrint('Exact alarms permission: $canScheduleExact');
  }

  Future<void> schedulePrayerNotification({
    required int id,
    required String prayerName,
    required DateTime prayerTime,
  }) async {
    final scheduledTime = tz.TZDateTime.from(prayerTime, tz.local);
    final now = tz.TZDateTime.now(tz.local);

    debugPrint('الوقت الحالي: $now');
    debugPrint('وقت الإشعار: $scheduledTime');

    if (!scheduledTime.isAfter(now)) {
      debugPrint('تم تجاهل $prayerName لأن موعده مضى.');
      return;
    }

    await _notifications.zonedSchedule(
      id: id,
      title: 'حان الآن موعد صلاة $prayerName',
      body: 'حي على الصلاة',
      scheduledDate: scheduledTime,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'prayer_times_channel',
          'مواقيت الصلاة',
          channelDescription: 'تنبيهات عند دخول وقت الصلاة',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );

    debugPrint('تمت جدولة $prayerName بنجاح، ID=$id');
  }

  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
    debugPrint('تم إلغاء جميع الإشعارات');
  }

  DateTime? parsePrayerTime(String time) {
    final match = RegExp(r'^(\d{1,2}):(\d{2})').firstMatch(time.trim());

    if (match == null) return null;

    final hour = int.parse(match.group(1)!);
    final minute = int.parse(match.group(2)!);

    if (hour > 23 || minute > 59) return null;

    final now = DateTime.now();

    return DateTime(now.year, now.month, now.day, hour, minute);
  }

  Future<void> scheduleAllPrayerNotifications({
    required Map<String, dynamic> prayerTimings,
  }) async {
    if (_isScheduling) return;

    _isScheduling = true;

    try {
      const prayers = <String, int>{
        'Fajr': 1,
        'Dhuhr': 2,
        'Asr': 3,
        'Maghrib': 4,
        'Isha': 5,
      };

      for (final entry in prayers.entries) {
        final time = prayerTimings[entry.key];

        if (time is! String || time == '--:--') continue;

        final prayerTime = parsePrayerTime(time);

        if (prayerTime == null) {
          debugPrint('وقت غير صالح للصلاة: ${entry.key} = $time');
          continue;
        }

        await schedulePrayerNotification(
          id: entry.value,
          prayerName: entry.key,
          prayerTime: prayerTime,
        );
      }

      final pending = await _notifications.pendingNotificationRequests();

      debugPrint('عدد الإشعارات المعلقة: ${pending.length}');
    } catch (e, stackTrace) {
      debugPrint('خطأ أثناء جدولة الإشعارات: $e');
      debugPrint('$stackTrace');
      rethrow;
    } finally {
      _isScheduling = false;
    }
  }

  Future<void> setPrayerNotificationsEnabled({
    required bool enabled,
    required Map<String, dynamic> prayerTimings,
  }) async {
    if (!enabled) {
      await AdhanPlayerService.instance.stopAdhan();
      await cancelAllNotifications();
      return;
    }

    await scheduleAllPrayerNotifications(prayerTimings: prayerTimings);
  }

  Future<void> showTestNotification() async {
    await _notifications.show(
      id: 1000,
      title: 'اختبار الإشعارات',
      body: 'لو ظهرت الرسالة دي، فالإشعارات العادية شغالة.',
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'prayer_times_channel',
          'مواقيت الصلاة',
          channelDescription: 'تنبيهات عند دخول وقت الصلاة',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
        ),
      ),
    );

    debugPrint('تم إرسال طلب عرض الإشعار التجريبي');
  }

  static Future<void> testAdhanAfterOneMinute() async {
    try {
      final testTime = DateTime.now().add(const Duration(minutes: 1));

      await instance.schedulePrayerNotification(
        id: 999,
        prayerName: 'تجربة الأذان',
        prayerTime: testTime,
      );

      debugPrint('تمت جدولة إشعار الاختبار');
    } catch (e, stackTrace) {
      debugPrint('خطأ في اختبار الإشعار: $e');
      debugPrint('$stackTrace');
    }
  }
}
