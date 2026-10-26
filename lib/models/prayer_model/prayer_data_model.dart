import 'prayer_date_model.dart';
import 'meta.dart';
import 'prayer_timings_model.dart';
class PrayerDataModel {
  PrayerDataModel({this.timings, this.date, this.meta});

  PrayerDataModel.fromJson(dynamic json) {
    timings = json['timings'] != null
        ? PrayerTimingsModel.fromJson(json['timings'])
        : null;

    date = json['date'] != null ? PrayerDateModel.fromJson(json['date']) : null;

    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  PrayerTimingsModel? timings;
  PrayerDateModel? date;
  Meta? meta;

  Map<String, dynamic> toJson() {
    return {
      'timings': timings?.toJson(),
      'date': date?.toJson(),
      'meta': meta?.toJson(),
    };
  }
}
