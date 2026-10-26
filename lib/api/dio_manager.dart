import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:islami_app/api/api_error_handler.dart';
import 'package:islami_app/models/prayer_model/prayer_data_model.dart';
import 'package:islami_app/models/radios_model/Radios_response_model.dart';
import 'package:islami_app/models/reciters_response_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:intl/intl.dart';

class DioManager {
  DioManager._();

  static DioManager? _instance;

  static DioManager getInstance() {
    _instance ??= DioManager._();
    return _instance!;
  }

  static final Dio dio =
      Dio(
          BaseOptions(
            baseUrl: 'https://api.aladhan.com/v1',
            receiveTimeout: const Duration(seconds: 10),
            connectTimeout: const Duration(seconds: 5),
          ),
        )
        ..interceptors.add(
          PrettyDioLogger(
            requestBody: true,
            responseHeader: true,
            responseBody: true,
            maxWidth: 90,
            enabled: kDebugMode,
          ),
        );

  static Future<PrayerDataModel> getPrayerData() async {
    final date = DateFormat('dd-MM-yyyy').format(DateTime.now());

    try {
      final response = await dio.get(
        '/timingsByCity/$date?city=Alexandria&country=egypt',
      );

      return PrayerDataModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioException(e);
    } catch (e) {
      rethrow;
    }
  }


  static Future<RecitersResponseModel> getReciters() async {
    try {
      final response = await dio.get(
        'https://mp3quran.net/api/v3/reciters',
        queryParameters: {'language': 'ar'},
      );

      return RecitersResponseModel.fromJson(
        Map<String, dynamic>.from(response.data as Map),
      );
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioException(e);
    }
  }

  static Future<RadiosResponseModel> getRadioData() async {
    try {
      var response = await dio.get(
        queryParameters: {'language': 'ar'},
        "https://mp3quran.net/api/v3/radios",
      );
      return RadiosResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioException(e);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> testPrayerData() async {
    try {
      final response = await DioManager.getPrayerData();

      final timings = response.timings;

      if (timings == null) {
        print('Prayer timings not found');
        return;
      }

      print('Fajr: ${timings.fajr}');
      print('Sunrise: ${timings.sunrise}');
      print('Dhuhr: ${timings.dhuhr}');
      print('Asr: ${timings.asr}');
      print('Maghrib: ${timings.maghrib}');
      print('Isha: ${timings.isha}');
    } catch (e) {
      print('Error fetching prayer data: $e');
    }
  }
}
