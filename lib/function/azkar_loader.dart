import 'dart:convert';
import 'package:flutter/services.dart';

class AzkarLoader {
  static Future<List<T>> loadAzkar<T>(
    String azkarType,
    T Function(dynamic json) fromJson,
  ) async {
    final jsonContent = jsonDecode(
      await rootBundle.loadString('assets/files/azkar/azkar.json'),
    );

    final List<dynamic> data = jsonContent[azkarType];

    return data.map((item) => fromJson(item)).toList();
  }
}
