import 'Weekday.dart';
import 'Month.dart';
import 'Designation.dart';


class Gregorian {
  Gregorian({
      this.date, 
      this.format, 
      this.day, 
      this.weekday, 
      this.month, 
      this.year, 
      this.designation, 
      this.lunarSighting,});

  Gregorian.fromJson(dynamic json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday = json['weekday'] != null ? Weekday.fromJson(json['weekday']) : null;
    month = json['month'] != null ? Month.fromJson(json['month']) : null;
    year = json['year'];
    designation = json['designation'] != null ? Designation.fromJson(json['designation']) : null;
    lunarSighting = json['lunarSighting'];
  }
  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;
  Designation? designation;
  bool? lunarSighting;

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
    map['lunarSighting'] = lunarSighting;
    return map;
  }

}