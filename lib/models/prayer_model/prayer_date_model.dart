import 'Hijri.dart';
import 'Gregorian.dart';


class PrayerDateModel {
  PrayerDateModel({
      this.readable, 
      this.timestamp, 
      this.hijri, 
      this.gregorian,});

  PrayerDateModel.fromJson(dynamic json) {
    readable = json['readable'];
    timestamp = json['timestamp'];
    hijri = json['hijri'] != null ? Hijri.fromJson(json['hijri']) : null;
    gregorian = json['gregorian'] != null ? Gregorian.fromJson(json['gregorian']) : null;
  }
  String? readable;
  String? timestamp;
  Hijri? hijri;
  Gregorian? gregorian;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['readable'] = readable;
    map['timestamp'] = timestamp;
    if (hijri != null) {
      map['hijri'] = hijri?.toJson();
    }
    if (gregorian != null) {
      map['gregorian'] = gregorian?.toJson();
    }
    return map;
  }

}