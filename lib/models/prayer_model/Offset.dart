
class Offset {
  Offset({
      this.imsak, 
      this.fajr, 
      this.sunrise, 
      this.dhuhr, 
      this.asr, 
      this.maghrib, 
      this.sunset, 
      this.isha, 
      this.midnight,});

  Offset.fromJson(dynamic json) {
    imsak = json['Imsak'];
    fajr = json['Fajr'];
    sunrise = json['Sunrise'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    maghrib = json['Maghrib'];
    sunset = json['Sunset'];
    isha = json['Isha'];
    midnight = json['Midnight'];
  }
  int? imsak;
  int? fajr;
  int? sunrise;
  int? dhuhr;
  int? asr;
  int? maghrib;
  int? sunset;
  int? isha;
  int? midnight;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Imsak'] = imsak;
    map['Fajr'] = fajr;
    map['Sunrise'] = sunrise;
    map['Dhuhr'] = dhuhr;
    map['Asr'] = asr;
    map['Maghrib'] = maghrib;
    map['Sunset'] = sunset;
    map['Isha'] = isha;
    map['Midnight'] = midnight;
    return map;
  }

}