import 'package:islami_app/function/azkar_loader.dart';

/// category : "أدعية قرآنية"
/// count : "01"
/// description : ""
/// reference : ". [البقرة - 201]."
/// content : "\\n', '\"رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ\". [البقرة - 201].\\n', '\\n', '\\n', '\\n', '\\n', '\\n', '\\n', '"

class QuranicSupplications {
  QuranicSupplications ({
      this.category, 
      this.count, 
      this.description, 
      this.reference, 
      this.content,});

  QuranicSupplications .fromJson(dynamic json) {
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
      'أدعية قرآنية',
          (json) => QuranicSupplications.fromJson(json),
    );
  }
}