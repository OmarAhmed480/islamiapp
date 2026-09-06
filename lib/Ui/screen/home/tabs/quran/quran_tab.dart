import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/%20provider/mostRecentProvider.dart';
import 'package:provider/provider.dart';

import 'package:islami_app/Ui/screen/home/tabs/quran/widget/costRecentCard.dart';
import 'package:islami_app/Ui/screen/home/tabs/quran/widget/custom_text_field.dart';
import 'package:islami_app/Ui/screen/home/tabs/quran/widget/surahItem.dart';
import 'package:islami_app/models/quran_resources.dart';
import 'package:islami_app/uitils/app_assets.dart';
import 'package:islami_app/uitils/app_colors.dart';
import 'package:islami_app/uitils/app_routes.dart';
import 'package:islami_app/uitils/app_style.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MostRecentProvider>().readMostRecent();
    });
  }

  @override
  Widget build(BuildContext context) {
    final mostRecentProvider = context.watch<MostRecentProvider>();
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              onChanged: (surasName) {
                quranSearch(surasName);
              },
              filled: true,
              fillColor: AppColors.black70,
              keyboardType: TextInputType.name,
              borderSideColor: AppColors.gold,
              hintText: "Sura Name",
              hintStyle: AppStyle.bold16w,
              radius: 10.r,
              textStyle: AppStyle.bold16w,
              prefixIcon: Image.asset(AppAssets.quranGold),
            ),
            SizedBox(height: 25.h),
            Text("Most Recently", style: AppStyle.bold16w),
            SizedBox(height: 15.h),
            Visibility(
              visible: mostRecentProvider.mostRecentlyList.isNotEmpty,
              child: SizedBox(
                height: 150.h,
                child: ListView.builder(
                  itemCount: mostRecentProvider.mostRecentlyList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final suraIndex =
                        mostRecentProvider.mostRecentlyList[index];
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
            ),
            SizedBox(height: 8.h),
            Text("Suras List", style: AppStyle.bold16w),
            SizedBox(height: 15.h),
            filterList.isEmpty
                ? Center(
                    child: Text("NO Sora Item", style: AppStyle.bold20Gold),
                  )
                : SizedBox(
                    height: 360.h,
                    child: ListView.builder(
                      itemCount: filterList.length,
                      itemBuilder: (context, index) {
                        final suraIndex = filterList[index];
                        return SurahItem(
                          number: suraIndex,
                          englishName:
                              QuranResources.englishQuranSurahs[suraIndex],
                          arabicName:
                              QuranResources.arabicQuranSuras[suraIndex],
                          verses: QuranResources.ayaNumber[suraIndex],
                          onTap: () {
                            mostRecentProvider.saveMostRecent(
                              newSuraIndex: suraIndex,
                            );
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
          ],
        ),
      ),
    );
  }

  void quranSearch(String surasName) {
    List<int> result = [];

    for (int i = 0; i < QuranResources.arabicQuranSuras.length; i++) {
      if (QuranResources.arabicQuranSuras[i].toLowerCase().contains(
        surasName.toLowerCase(),
      )) {
        result.add(i);
      }

      if (QuranResources.englishQuranSurahs[i].toLowerCase().contains(
        surasName.toLowerCase(),
      )) {
        result.add(i);
      }
    }

    filterList = result;

    setState(() {});
  }
}
