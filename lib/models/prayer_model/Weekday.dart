class Weekday {
  Weekday({this.en, this.ar});

  Weekday.fromJson(dynamic json) {
    en = json['en'];
    ar = json['ar'];
  }

  String? en;
  String? ar;

  Map<String, dynamic> toJson() {
    return {'en': en, 'ar': ar};
  }
}
