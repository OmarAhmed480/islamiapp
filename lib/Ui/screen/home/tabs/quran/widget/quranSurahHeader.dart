import 'package:flutter/material.dart';
import 'package:islami_app/models/quran_resources.dart';
import 'package:islami_app/uitils/app_assets.dart';
import 'package:islami_app/uitils/app_style.dart';

class QuranSurahHeader extends StatelessWidget {
  final int surahIndex;

  const QuranSurahHeader({super.key, required this.surahIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(AppAssets.leftCorner, fit: BoxFit.fill),
        Text(
          QuranResources.arabicQuranSuras[surahIndex],
          style: AppStyle.bold20Gold,
        ),
        Image.asset(AppAssets.rightCorner, fit: BoxFit.fill),
      ],
    );
  }
}
