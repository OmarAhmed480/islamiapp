import 'Moshaf.dart';

/// id : 1
/// name : "إبراهيم الأخضر"
/// letter : "إ"
/// date : "2025-09-06T00:39:03.000000Z"
/// moshaf : [{"id":1,"name":"حفص عن عاصم - مرتل","rewaya_id":1,"server":"https://cdn.mp3quran.net/audio/ibrahim-akhdar/r1/","surah_total":114,"moshaf_type":11,"surah_list":"1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114"}]

class Reciters {
  Reciters({
      this.id, 
      this.name, 
      this.letter, 
      this.date, 
      this.moshaf,});

  Reciters.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    letter = json['letter'];
    date = json['date'];
    if (json['moshaf'] != null) {
      moshaf = [];
      json['moshaf'].forEach((v) {
        moshaf?.add(Moshaf.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  String? letter;
  String? date;
  List<Moshaf>? moshaf;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['letter'] = letter;
    map['date'] = date;
    if (moshaf != null) {
      map['moshaf'] = moshaf?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}