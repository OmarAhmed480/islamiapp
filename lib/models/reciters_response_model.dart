import 'package:islami_app/models/reciters_model/Reciters.dart';

class RecitersResponseModel {
  RecitersResponseModel({this.reciters});

  List<Reciters>? reciters;

  factory RecitersResponseModel.fromJson(Map<String, dynamic> json) {
    final recitersJson = json['reciters'] as List<dynamic>?;

    return RecitersResponseModel(
      reciters: recitersJson?.map((item) {
        return Reciters.fromJson(Map<String, dynamic>.from(item as Map));
      }).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (reciters != null)
        'reciters': reciters!.map((reciter) => reciter.toJson()).toList(),
    };
  }
}
