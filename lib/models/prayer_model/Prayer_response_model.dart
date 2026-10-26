

import 'package:islami_app/models/prayer_model/prayer_data_model.dart';

/// code : 200
/// status : "OK"
/// data : {"timings":{"Fajr":"04:22","Sunrise":"06:05","Dhuhr":"13:01","Asr":"16:38","Sunset":"19:57","Maghrib":"19:57","Isha":"21:28","Imsak":"04:12","Midnight":"01:01","Firstthird":"23:20","Lastthird":"02:42"},"date":{"readable":"16 Jul 2024","timestamp":"1721102400","hijri":{"date":"10-01-1446","format":"DD-MM-YYYY","day":"10","weekday":{"en":"Al Thalaata","ar":"الثلاثاء"},"month":{"number":1,"en":"Muḥarram","ar":"مُحَرَّم","days":29},"year":"1446","designation":{"abbreviated":"AH","expanded":"Anno Hegirae"},"holidays":["Ashura","Urs of Shaykh Shamsuddin Habīb Allah ق","Urs of Shaykh Abū al‑Hassan al‑Kharqāni ق","Birth of Imam Rābbani Ahmad Al-Fāruqi As-Sirhindi ق"],"adjustedHolidays":[],"method":"HJCoSA"},"gregorian":{"date":"16-07-2024","format":"DD-MM-YYYY","day":"16","weekday":{"en":"Tuesday"},"month":{"number":7,"en":"July"},"year":"2024","designation":{"abbreviated":"AD","expanded":"Anno Domini"},"lunarSighting":false}},"meta":{"latitude":8.8888888,"longitude":7.7777777,"timezone":"Africa/Cairo","method":{"id":5,"name":"Egyptian General Authority of Survey","params":{"Fajr":19.5,"Isha":17.5},"location":{"latitude":30.0444196,"longitude":31.2357116}},"latitudeAdjustmentMethod":"ANGLE_BASED","midnightMode":"STANDARD","school":"STANDARD","offset":{"Imsak":0,"Fajr":0,"Sunrise":0,"Dhuhr":0,"Asr":0,"Maghrib":0,"Sunset":0,"Isha":0,"Midnight":0}}}

class PrayerResponseModel {
  PrayerResponseModel({
      this.code, 
      this.status, 
      this.data,});

  PrayerResponseModel.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? PrayerDataModel.fromJson(json['data']) : null;
  }
  int? code;
  String? status;
  PrayerDataModel? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}