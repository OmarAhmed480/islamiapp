import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/Ui/screen/home/tabs/quran/widget/surahItem.dart';
import 'package:islami_app/models/quran_resources.dart';
import 'package:islami_app/uitils/app_style.dart';

class SurahListWidget extends StatelessWidget {
  final List<int> filterList;
  final Function(int) onTap;

  const SurahListWidget({
    super.key,
    required this.filterList,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (filterList.isEmpty) {
      return Center(child: Text("NO Sora Item", style: AppStyle.bold20Gold));
    }

    return SizedBox(
      height: 360.h,
      child: ListView.builder(
        itemCount: filterList.length,
        itemBuilder: (context, index) {
          final suraIndex = filterList[index];

          return SurahItem(
            number: suraIndex,
            englishName: QuranResources.englishQuranSurahs[suraIndex],
            arabicName: QuranResources.arabicQuranSuras[suraIndex],
            verses: QuranResources.ayaNumber[suraIndex],
            onTap: () => onTap(suraIndex),
          );
        },
      ),
    );
  }
}
