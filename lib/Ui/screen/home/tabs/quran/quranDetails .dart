import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/models/quran_resources.dart';
import 'package:islami_app/uitils/app_assets.dart';
import 'package:islami_app/uitils/app_colors.dart';
import 'package:islami_app/uitils/app_routes.dart';
import 'package:islami_app/uitils/app_style.dart';

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
      appBar: AppBar(
        backgroundColor: AppColors.black,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_rounded, color: AppColors.gold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).pushNamed(AppRoutes.quranDetails2RouteName, arguments: index);
            },
            icon: Icon(Icons.bookmark, color: AppColors.gold, size: 30.sp),
          ),
        ],
        title: Text(
          QuranResources.englishQuranSurahs[index],
          style: AppStyle.bold20Gold,
        ),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.leftCorner, fit: BoxFit.fill),
                Text(
                  QuranResources.arabicQuranSuras[index],
                  style: AppStyle.bold20Gold,
                ),
                Image.asset(AppAssets.rightCorner, fit: BoxFit.fill),
              ],
            ),

            SizedBox(height: 5.h),

            Expanded(
              child: verses.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(color: AppColors.gold),
                    )
                  : SingleChildScrollView(
                      padding: REdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                      child: Text(
                        verses
                            .asMap()
                            .entries
                            .map((entry) {
                              final verseIndex = entry.key;
                              final verse = entry.value;
                              return '$verse(${verseIndex + 1})';
                            })
                            .join(' '),
                        style: AppStyle.bold20Gold,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
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
