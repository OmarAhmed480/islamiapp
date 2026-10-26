import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/Ui/screen/home/tabs/quran/widget/quranDetailsAppBar.dart';
import 'package:islami_app/Ui/screen/home/tabs/quran/widget/quranSurahHeader.dart';
import 'package:islami_app/Ui/screen/home/tabs/quran/widget/versesWidget.dart';

import 'package:islami_app/uitils/app_assets.dart';
import 'package:islami_app/uitils/app_colors.dart';


class QuranDetails extends StatefulWidget {
  QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  List<String> verses = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final int index = ModalRoute.of(context)!.settings.arguments as int;

    if (verses.isEmpty) {
      loadSuraFile(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: QuranDetailsAppBar( index: index, ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),

            QuranSurahHeader(
              surahIndex: index,
            ),

            SizedBox(height: 5.h),

            VersesWidget( verses: verses, ),

            Image.asset(AppAssets.imgBottomDecoration, fit: BoxFit.fill),
          ],
        ),
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      "assets/files/quran/${index + 1}.txt",
    );

    List<String> lines = fileContent
        .split("\n")
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toList();

    if (!mounted) return;

    setState(() {
      verses = lines;
    });
  }
}
