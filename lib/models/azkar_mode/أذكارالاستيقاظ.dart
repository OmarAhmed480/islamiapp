import 'package:islami_app/function/azkar_loader.dart';
import 'package:islami_app/models/azkar_mode/%D8%A3%D8%AF%D8%B9%D9%8A%D8%A9%D9%82%D8%B1%D8%A2%D9%86%D9%8A%D8%A9.dart';

/// category : "أذكار الاستيقاظ"
/// count : "01"
/// description : ""
/// reference : ""
/// content : "الحَمْـدُ لِلّهِ الّذي أَحْـيانا بَعْـدَ ما أَماتَـنا وَإليه النُّـشور."

class WakeUpAzkar {
  WakeUpAzkar({
      this.category, 
      this.count, 
      this.description, 
      this.reference, 
      this.content,});

  WakeUpAzkar.fromJson(dynamic json) {
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
  static Future<List<QuranicSupplications>> loadQuranicSupplications() {
    return AzkarLoader.loadAzkar(
      'أذكار الاستيقاظ',
          (json) => QuranicSupplications.fromJson(json),
    );
  }
}