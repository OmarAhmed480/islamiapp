import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/Ui/screen/home/tabs/quran/widget/quranVerseItem.dart';
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
bool isSelected=false;
  @override
  Widget build(BuildContext context) {
    final int surahIndex =
    ModalRoute.of(context)!.settings.arguments as int;
    loadSuraFile(surahIndex);
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_rounded, color: AppColors.gold),
        ),
        title: Text(
          QuranResources.englishQuranSurahs[surahIndex],
          style: AppStyle.bold20Gold,
        ),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.leftCorner, fit: BoxFit.fill),
                Text(
                  QuranResources.arabicQuranSuras[surahIndex],
                  style: AppStyle.bold20Gold,
                ),
                Image.asset(AppAssets.rightCorner, fit: BoxFit.fill),
              ],
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: verses.isEmpty
                  ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.gold,
                ),
              )
                  : ListView.separated(
                itemBuilder: (context, index) => QuranVerseItem(
                  index: index,
                  verse: verses[index],
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 8.h,
                ),
                itemCount: verses.length,
              ),
            ),
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
    List<String> lines = fileContent.split("\n");
    verses = lines;
    await Future.delayed(Duration(seconds: 2),(){});
    setState(() {});
  }
}
