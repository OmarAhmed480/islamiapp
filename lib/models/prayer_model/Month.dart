class Month {
  Month({this.number, this.en, this.ar, this.days});

  Month.fromJson(dynamic json) {
    number = json['number'];
    en = json['en'];
    ar = json['ar'];
    days = json['days'];
  }

  int? number;
  String? en;
  String? ar;
  int? days;

  Map<String, dynamic> toJson() {
    return {'number': number, 'en': en, 'ar': ar, 'days': days};
  }
}
