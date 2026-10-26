import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/Ui/screen/home/tabs/quran/widget/quranVerseItem.dart';
import 'package:islami_app/uitils/app_colors.dart';

class QuranVersesList extends StatelessWidget {
  final List<String> verses;
  final int? selectedVerseIndex;
  final ValueChanged<int> onVerseTap;

  const QuranVersesList({
    super.key,
    required this.verses,
    required this.selectedVerseIndex,
    required this.onVerseTap,
  });

  @override
  Widget build(BuildContext context) {
    if (verses.isEmpty) {
      return Center(child: CircularProgressIndicator(color: AppColors.gold));
    }

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return QuranVerseItem(
          index: index,
          verse: verses[index],
          isSelected: selectedVerseIndex == index,
          onTap: () => onVerseTap(index),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 8.h);
      },
      itemCount: verses.length,
    );
  }
}
