import 'package:islami_app/function/azkar_loader.dart';

/// category : "أذكار النوم"
/// count : "01"
/// description : ""
/// reference : ""
/// content : "بِاسْمِكَ رَبِّـي وَضَعْـتُ جَنْـبي ، وَبِكَ أَرْفَعُـه، فَإِن أَمْسَـكْتَ نَفْسـي فارْحَـمْها ، وَإِنْ أَرْسَلْتَـها فاحْفَظْـها بِمـا تَحْفَـظُ بِه عِبـادَكَ الصّـالِحـين."

class SleepAzkar{
  SleepAzkar({
      this.category, 
      this.count, 
      this.description, 
      this.reference, 
      this.content,});

  SleepAzkar.fromJson(dynamic json) {
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
  static Future<List<SleepAzkar>> loadSleepAzkar() {
    return AzkarLoader.loadAzkar(
      'أذكار النوم',
          (json) => SleepAzkar.fromJson(json),
    );
  }
}