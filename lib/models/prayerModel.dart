class PrayerModel {
  String name;
  String time;
  String amPm;

  PrayerModel({
    required this.name,
    required this.time,
    required this.amPm,
  });

  static List<PrayerModel> prayers = [
    PrayerModel(
      name: "FAJR",
      time: "04:38",
      amPm: "AM",
    ),
    PrayerModel(
      name: "SUNRISE",
      time: "06:00",
      amPm: "AM",
    ),
    PrayerModel(
      name: "DHUHR",
      time: "12:00",
      amPm: "PM",
    ),
    PrayerModel(
      name: "ASR",
      time: "04:38",
      amPm: "PM",
    ),
    PrayerModel(
      name: "MAGHRIB",
      time: "06:30",
      amPm: "PM",
    ),
    PrayerModel(
      name: "ISHA",
      time: "08:00",
      amPm: "PM",
    ),
    PrayerModel(
      name: "ASR",
      time: "04:38",
      amPm: "PM",
    ),
  ];








}