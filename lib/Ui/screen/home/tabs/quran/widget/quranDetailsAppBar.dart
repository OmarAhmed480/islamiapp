import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/models/quran_resources.dart';
import 'package:islami_app/uitils/app_colors.dart';
import 'package:islami_app/uitils/app_routes.dart';
import 'package:islami_app/uitils/app_style.dart';

class QuranDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final int index;

  const QuranDetailsAppBar({super.key, required this.index, });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
