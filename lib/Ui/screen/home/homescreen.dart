import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/Ui/screen/home/tabs/Hadeth/Hadeth_Tab.dart';
import 'package:islami_app/Ui/screen/home/tabs/Radio/radio_tab.dart';
import 'package:islami_app/Ui/screen/home/tabs/Sebha/sebhaTab.dart';
import 'package:islami_app/Ui/screen/home/tabs/Time/time_tab.dart';
import 'package:islami_app/Ui/screen/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/uitils/app_assets.dart';
import 'package:islami_app/uitils/app_colors.dart';
import 'package:islami_app/uitils/app_style.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabList = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  List<String> backgroundList = [
    AppAssets.quranBG,
    AppAssets.hadithBG,
    AppAssets.sebHaBG,
    AppAssets.radioBG,
    AppAssets.timeBG,
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.white,
          selectedLabelStyle: AppStyle.bold16w.copyWith(
            fontSize: 12.sp,

          ),
          backgroundColor: AppColors.gold,
          showUnselectedLabels: false,
          showSelectedLabels: true,

          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            buildBottomNavBar(
              iconSelected: AppAssets.quran,
              label: "Quran",
              index: 0,
            ),
            buildBottomNavBar(
              iconSelected: AppAssets.hadeth,
              label: "Hadeth",
              index: 1,
            ),
            buildBottomNavBar(
              iconSelected: AppAssets.sebha,
              label: "Sebha",
              index: 2,
            ),
            buildBottomNavBar(
              iconSelected: AppAssets.radio,
              label: "Radio",
              index: 3,
            ),
            buildBottomNavBar(
              iconSelected: AppAssets.time,
              label: "Time",
              index: 4,
            ),
          ],
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(backgroundList[selectedIndex], fit: BoxFit.fill),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [AppColors.black60, AppColors.black],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 15.h),

                Center(child: Image.asset(AppAssets.header, fit: BoxFit.cover)),
                Expanded(child: tabList[selectedIndex]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavBar({
    required String iconSelected,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index
          ? Container(
              decoration: BoxDecoration(
                color: AppColors.black60,
                borderRadius: BorderRadius.circular(66.r),
              ),
              height: 45.h,
              width: 70.w,
              child: ImageIcon(
                AssetImage(iconSelected),
                color: AppColors.white,
              ),
            )
          : ImageIcon(AssetImage(iconSelected), color: AppColors.black),
      label: label,
    );
  }
}
