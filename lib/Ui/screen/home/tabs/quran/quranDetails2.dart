import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:islami_app/Ui/screen/home/tabs/quran/widget/quranDetailsAppBar.dart';
import 'package:islami_app/Ui/screen/home/tabs/quran/widget/quranVerseItem.dart';
import 'package:islami_app/Ui/screen/home/tabs/quran/widget/quranVersesList.dart';
import 'package:islami_app/models/quran_resources.dart';
import 'package:islami_app/uitils/app_assets.dart';
import 'package:islami_app/uitils/app_colors.dart';
import 'package:islami_app/uitils/app_style.dart';

class QuranDetails2 extends StatefulWidget {
  const QuranDetails2({super.key});

  @override
  State<QuranDetails2> createState() => _QuranDetails2State();
}

class _QuranDetails2State extends State<QuranDetails2> {
  List<String> verses = [];

  int? selectedVerseIndex;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final int surahIndex = ModalRoute.of(context)!.settings.arguments as int;

    if (verses.isEmpty) {
      loadSuraFile(surahIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    final int surahIndex = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: QuranDetailsAppBar(index: surahIndex),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 10.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.leftCorner, fit: BoxFit.fill),

                Expanded(
                  child: Text(
                    QuranResources.arabicQuranSuras[surahIndex],
                    textAlign: TextAlign.center,
                    style: AppStyle.bold20Gold,
                  ),
                ),

                Image.asset(AppAssets.rightCorner, fit: BoxFit.fill),
              ],
            ),

            SizedBox(height: 10.h),

            Expanded(
              child: QuranVersesList(
                verses: verses,
                selectedVerseIndex: selectedVerseIndex,
                onVerseTap: (index) {
                  setState(() {
                    selectedVerseIndex = index;
                  });
                },
              ),
            ),

            Image.asset(AppAssets.imgBottomDecoration, fit: BoxFit.fill),
          ],
        ),
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    try {
      final String fileContent = await rootBundle.loadString(
        'assets/files/quran/${index + 1}.txt',
      );

      final List<String> lines = fileContent
          .split('\n')
          .map((line) => line.trim())
          .where((line) => line.isNotEmpty)
          .toList();

      if (!mounted) return;

      setState(() {
        verses = lines;
      });
    } catch (e) {
      debugPrint('Error loading Surah: $e');
    }
  }
}
