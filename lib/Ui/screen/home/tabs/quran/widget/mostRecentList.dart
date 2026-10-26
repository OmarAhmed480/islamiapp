import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/Ui/screen/home/tabs/quran/widget/costRecentCard.dart';
import 'package:islami_app/models/quran_resources.dart';
import 'package:islami_app/uitils/app_assets.dart';
import 'package:islami_app/uitils/app_routes.dart';


class MostRecentList extends StatelessWidget {
  final List<int> mostRecentlyList;

  const MostRecentList({
    super.key,
    required this.mostRecentlyList,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: mostRecentlyList.isNotEmpty,
      child: SizedBox(
        height: 150.h,
        child: ListView.builder(
          itemCount: mostRecentlyList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final suraIndex = mostRecentlyList[index];

            return MostRecentCard(
              title: QuranResources.englishQuranSurahs[suraIndex],
              arabicTitle: QuranResources.arabicQuranSuras[suraIndex],
              verses: "${QuranResources.ayaNumber[suraIndex]} Verses",
              image: AppAssets.imgMostRecent,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.quranDetailsRouteName,
                  arguments: suraIndex,
                );
              },
            );
          },
        ),
      ),
    );
  }
}