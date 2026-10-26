import 'package:islami_app/function/azkar_loader.dart';
import 'package:islami_app/models/azkar_mode/%D8%A3%D8%AF%D8%B9%D9%8A%D8%A9%D8%A7%D9%84%D8%A3%D9%86%D8%A8%D9%8A%D8%A7%D8%A1.dart';

/// category : "تسابيح"
/// count : "100"
/// description : "يكتب له ألف حسنة أو يحط عنه ألف خطيئة."
/// reference : ""
/// content : "سُبْحَانَ اللَّهِ"

class GlorificationOfAllah {
  GlorificationOfAllah ({
      this.category, 
      this.count, 
      this.description, 
      this.reference, 
      this.content,});

  GlorificationOfAllah .fromJson(dynamic json) {
    category = json['category'];
    count = json['count'];
    description = json['description'];
    reference = json['reference'];
    content = json['content'];
  }
  String? category;
  String? count;
  String? description;
  String? reference;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = category;
    map['count'] = count;
    map['description'] = description;
    map['reference'] = reference;
    map['content'] = content;
    return map;
  }
  static Future<List<ProphetsSupplications>> loadSupplications() {
    return AzkarLoader.loadAzkar(
      'تسابيحة',
          (json) => ProphetsSupplications.fromJson(json),
    );
  }

}