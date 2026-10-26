import 'dart:convert';

import 'package:flutter/services.dart';

/// category : "أذكار الصباح"
/// count : "1"
/// description : ""
/// reference : ""
/// content : "أَصْـبَحْنا وَأَصْـبَحَ المُـلْكُ لله وَالحَمدُ لله ، لا إلهَ إلاّ اللّهُ وَحدَهُ لا شَريكَ لهُ، لهُ المُـلكُ ولهُ الحَمْـد، وهُوَ على كلّ شَيءٍ قدير"

class MorningAzkar {
  MorningAzkar({
      this.category,
      this.count,
      this.description,
      this.reference,
      this.content,});

  MorningAzkar.fromJson(dynamic json) {
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

 static Future<List<MorningAzkar>> loadAzkarContent(String azkarType) async {
    final jsonContent = jsonDecode(
      await rootBundle.loadString('assets/files/azkar/azkar.json'),
    );

    final List<dynamic> data = jsonContent[azkarType];

    final List<MorningAzkar> azkar = [];

    for (final item in data) {
      if (item is List) {
        for (final subItem in item) {
          azkar.add(MorningAzkar.fromJson(subItem));
        }
      } else if (item is Map<String, dynamic>) {
        azkar.add(MorningAzkar.fromJson(item));
      }
    }

    return azkar;
  }


}