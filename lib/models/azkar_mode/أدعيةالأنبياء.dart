
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:islami_app/function/azkar_loader.dart';
import 'package:islami_app/models/azkar_mode/morning_azkar.dart';

class ProphetsSupplications {
  ProphetsSupplications({
      this.category, 
      this.count, 
      this.description, 
      this.reference, 
      this.content,});

  ProphetsSupplications.fromJson(dynamic json) {
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
      'أدعية الأنبياء',
          (json) => ProphetsSupplications.fromJson(json),
    );
  }


}