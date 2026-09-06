import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/Ui/screen/home/tabs/Hadeth/widget/hadithCard.dart';
import 'package:islami_app/models/hideth_item.dart';
import 'package:islami_app/uitils/app_colors.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  final List<int> number = List.generate(50, (index) => index + 1,);

  Hideth? hideth;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    loadHadethFile(0);
  }

  @override
  Widget build(BuildContext context) {
    if (hideth == null) {
      return Center(
        child: CircularProgressIndicator(
          color: AppColors.gold,
        ),
      );
    }

    return CarouselSlider(
      options:CarouselOptions(
        height: 638.h,
        viewportFraction: .90,
        enlargeCenterPage: true,
        enlargeFactor: 0.30,
        initialPage: 0,
        enableInfiniteScroll: false,
        pageSnapping: true,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {
          currentIndex = index;
          Future.delayed(Duration(seconds: 5),(){});
          loadHadethFile(index);
        },
      ),
      items: number.map((index) {
        return HadithCard(
          index: index,
          hadithNumber: hideth!.title,
          hadithText: hideth!.content,
        );
      }).toList(),
    );
  }

  Future<void> loadHadethFile(int index) async {
    String hadethContent = await rootBundle.loadString(
      "assets/files/hadeth/h${index + 1}.txt",
    );

    int firstLine = hadethContent.indexOf("\n");

    String title = hadethContent.substring(0, firstLine,);
    String content = hadethContent.substring(firstLine + 1,);

    setState(() {
      hideth = Hideth(
        title: title,
        content: content,
      );
    });
  }
}