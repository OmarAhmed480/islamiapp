import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:islami_app/models/prayer_model/Gregorian.dart';
import 'package:islami_app/models/prayer_model/Hijri.dart';
import 'package:islami_app/notification_service/notification_service.dart';

class DateFormatter {
  static String fromGregorianDate(Gregorian gregorianDate) {
    return "${gregorianDate.day} ${gregorianDate.month!.en!.substring(0, 3)}\n${gregorianDate.year}";
  }

  static String fromHijriDate(Hijri hijriDate) {
    return "${hijriDate.day} ${hijriDate.month!.en!.substring(0, 5)}\n${hijriDate.year}";
  }
}

class TimeConvert {
  static String to12Hour(String time) {
    DateTime dataTime = DateFormat("HH:mm").parse(time);
    String time12Hour = DateFormat("HH:mm\n  a").format(dataTime);
    return time12Hour;
  }
}

class PrayerTime {
  static Map<String, String> sortPrayerTimes(Map<String, dynamic> prayerTimes) {
    final DateTime now = DateTime.now();

    final sortedEntries = prayerTimes.entries.toList()
      ..sort((a, b) {
        final timeA = _parsePrayerTime(a.value.toString(), now);
        final timeB = _parsePrayerTime(b.value.toString(), now);

        return timeA.compareTo(timeB);
      });

    return Map.fromEntries(
      sortedEntries.map((entry) => MapEntry(entry.key, entry.value.toString())),
    );
  }

  static DateTime _parsePrayerTime(String time, DateTime now) {
    final parts = time.split(':');

    return DateTime(
      now.year,
      now.month,
      now.day,
      int.parse(parts[0]),
      int.parse(parts[1]),
    );
  }

  static Duration getNextPrayerCountDown(Map<String, dynamic> prayerTimes) {
    final DateTime now = DateTime.now();
    Duration? nextPrayerCountdown;

    prayerTimes.forEach((prayerName, timeString) {
      final parts = timeString.toString().split(':');

      final prayerTime = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(parts[0]),
        int.parse(parts[1]),
      );

      if (prayerTime.isAfter(now)) {
        final difference = prayerTime.difference(now);

        if (nextPrayerCountdown == null || difference < nextPrayerCountdown!) {
          nextPrayerCountdown = difference;
        }
      }
    });

    if (nextPrayerCountdown != null) {
      return nextPrayerCountdown!;
    }

    // لو كل صلوات اليوم عدت، نحسب الوقت المتبقي لفجر اليوم التالي.
    final fajrParts = prayerTimes['Fajr'].toString().split(':');

    final nextFajr = DateTime(
      now.year,
      now.month,
      now.day + 1,
      int.parse(fajrParts[0]),
      int.parse(fajrParts[1]),
    );

    return nextFajr.difference(now);
  }

  static MapEntry<String, String> getNextPrayer(
      Map<String, dynamic> prayerTimes,
      ) {
    final now = DateTime.now();

    final validPrayerTimes = prayerTimes.entries.where((entry) {
      return entry.value is String &&
          RegExp(r'^\d{1,2}:\d{2}$').hasMatch(entry.value);
    }).toList();

    validPrayerTimes.sort((a, b) {
      final timeA = _parsePrayerTime(a.value.toString(), now);
      final timeB = _parsePrayerTime(b.value.toString(), now);

      return timeA.compareTo(timeB);
    });

    for (final prayer in validPrayerTimes) {
      final prayerDateTime = _parsePrayerTime(
        prayer.value.toString(),
        now,
      );

      if (prayerDateTime.isAfter(now)) {
        return MapEntry(prayer.key, prayer.value.toString());
      }
    }
    final fajr = prayerTimes['Fajr'];

    if (fajr is String &&
        RegExp(r'^\d{1,2}:\d{2}$').hasMatch(fajr)) {
      final parts = fajr.split(':');

      final tomorrowFajr = DateTime(
        now.year,
        now.month,
        now.day + 1,
        int.parse(parts[0]),
        int.parse(parts[1]),
      );

      return MapEntry('Fajr', fajr);
    }
    return const MapEntry('Fajr', '--:--');
  }


}
