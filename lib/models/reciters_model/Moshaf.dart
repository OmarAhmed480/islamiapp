/// id : 1
/// name : "حفص عن عاصم - مرتل"
/// rewaya_id : 1
/// server : "https://cdn.mp3quran.net/audio/ibrahim-akhdar/r1/"
/// surah_total : 114
/// moshaf_type : 11
/// surah_list : "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114"

class Moshaf {
  Moshaf({
      this.id, 
      this.name, 
      this.rewayaId, 
      this.server, 
      this.surahTotal, 
      this.moshafType, 
      this.surahList,});

  Moshaf.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    rewayaId = json['rewaya_id'];
    server = json['server'];
    surahTotal = json['surah_total'];
    moshafType = json['moshaf_type'];
    surahList = json['surah_list'];
  }
  int? id;
  String? name;
  int? rewayaId;
  String? server;
  int? surahTotal;
  int? moshafType;
  String? surahList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['rewaya_id'] = rewayaId;
    map['server'] = server;
    map['surah_total'] = surahTotal;
    map['moshaf_type'] = moshafType;
    map['surah_list'] = surahList;
    return map;
  }

}