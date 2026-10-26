import 'package:islami_app/function/azkar_loader.dart';
import 'package:islami_app/models/azkar_mode/%D8%A3%D8%AF%D8%B9%D9%8A%D8%A9%D8%A7%D9%84%D8%A3%D9%86%D8%A8%D9%8A%D8%A7%D8%A1.dart';

/// category : "أذكار المساء"
/// count : "01"
/// description : ""
/// reference : ""
/// content : "أَمْسَيْـنا وَأَمْسـى المـلكُ لله وَالحَمدُ لله ، لا إلهَ إلاّ اللّهُ وَحدَهُ لا شَريكَ لهُ، لهُ المُـلكُ ولهُ الحَمْـد، وهُوَ على كلّ شَيءٍ قدير ، رَبِّ أسْـأَلُـكَ خَـيرَ ما في هـذهِ اللَّـيْلَةِ وَخَـيرَ ما بَعْـدَهـا ، وَأَعـوذُ بِكَ مِنْ شَـرِّ ما في هـذهِ اللَّـيْلةِ وَشَرِّ ما بَعْـدَهـا ، رَبِّ أَعـوذُبِكَ مِنَ الْكَسَـلِ وَسـوءِ الْكِـبَر ، رَبِّ أَعـوذُ بِكَ مِنْ عَـذابٍ في النّـارِ وَعَـذابٍ في القَـبْر."

class EveningAzkar {
  EveningAzkar({
      this.category, 
      this.count, 
      this.description, 
      this.reference, 
      this.content,});

  EveningAzkar.fromJson(dynamic json) {
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
      'أذكار المساء',
          (json) => ProphetsSupplications.fromJson(json),
    );
  }

}