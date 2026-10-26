
class Params {
  Params({
      this.fajr, 
      this.isha,});

  Params.fromJson(dynamic json) {
    fajr = json['Fajr'];
    isha = json['Isha'];
  }
  double? fajr;
  double? isha;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Fajr'] = fajr;
    map['Isha'] = isha;
    return map;
  }

}