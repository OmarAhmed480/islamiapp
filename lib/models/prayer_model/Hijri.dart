import 'Weekday.dart';
import 'Month.dart';
import 'Designation.dart';

class Hijri {
  Hijri({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.holidays,
    this.adjustedHolidays,
    this.method,
  });

  Hijri.fromJson(dynamic json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday = json['weekday'] != null
        ? Weekday.fromJson(json['weekday'])
        : null;
    month = json['month'] != null ? Month.fromJson(json['month']) : null;
    year = json['year'];
    designation = json['designation'] != null
        ? Designation.fromJson(json['designation'])
        : null;
    holidays = json['holidays'] != null ? json['holidays'].cast<String>() : [];
    if (json['adjustedHolidays'] != null) {
      adjustedHolidays = [];
      json['adjustedHolidays'].forEach((v) {
        adjustedHolidays?.add(v);
      });
    }
    method = json['method'];
  }

  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;
  Designation? designation;
  List<String>? holidays;
  List<dynamic>? adjustedHolidays;
  String? method;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['format'] = format;
    map['day'] = day;
    if (weekday != null) {
      map['weekday'] = weekday?.toJson();
    }
    if (month != null) {
      map['month'] = month?.toJson();
    }
    map['year'] = year;
    if (designation != null) {
      map['designation'] = designation?.toJson();
    }
    map['holidays'] = holidays;
    if (adjustedHolidays != null) {
      map['adjustedHolidays'] = adjustedHolidays
          ?.map((v) => v.toJson())
          .toList();
    }
    map['method'] = method;
    return map;
  }
}
