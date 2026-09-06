import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/Ui/screen/home/tabs/Radio/wedget/customRadioIcon.dart';
import 'package:islami_app/Ui/screen/home/tabs/Radio/wedget/customRadioTab.dart';
import 'package:islami_app/uitils/app_assets.dart';
import 'package:islami_app/uitils/app_colors.dart';
import 'package:islami_app/uitils/app_style.dart';

class RadioTab extends StatefulWidget {
  RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int isSelected = 0;


  bool radioPlaying = true;
  bool radioMuted = true;


  bool reciterPlaying = true;
  bool reciterMuted = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  onTap: (index) {
                    setState(() {
                      isSelected = index;
                    });
                  },
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  tabs: [
                    Tab(
                      child: CustomRadioTab(
                        title: "Radio",
                        isSelected: isSelected == 0,
                      ),
                    ),
                    Tab(
                      child: CustomRadioTab(
                        title: "Reciters",
                        isSelected: isSelected == 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 141.h,
                  child: TabBarView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: AppColors.gold,
                        ),
                        width: 390.w,
                        child: Stack(
                          children: [
                            radioPlaying
                                ? Positioned(
                                    top: 78.h,
                                    right: 1.w,
                                    left: 2.w,
                                    child: Image.asset(
                                      AppAssets.rectangle,
                                      fit: BoxFit.cover,
                                      color: AppColors.black,
                                    ),
                                  )
                                : Positioned(
                                    top: 15.h,
                                    child: Image.asset(
                                      AppAssets.imgBottomDecoration,
                                      fit: BoxFit.fill,
                                      color: AppColors.black,
                                    ),
                                  ),

                            Positioned(
                              top: 10.h,
                              right: 67.w,
                              child: Center(
                                child: Text(
                                  "Radio Ibrahim Al-Akdar",
                                  style: AppStyle.bold20bl,
                                ),
                              ),
                            ),

                            Positioned(
                              top: 70.h,
                              left: 225.w,
                              child: Row(
                                children: [
                                  CustomRadioIcon(
                                    isSelected: radioPlaying,
                                    selectedIcon: AppAssets.paley,
                                    unSelectedIcon: AppAssets.stop,
                                    onTap: () {
                                      setState(() {
                                        radioPlaying = !radioPlaying;
                                      });
                                    },
                                  ),

                                  SizedBox(width: 20.w),
                                  CustomRadioIcon(
                                    isSelected: radioMuted,
                                    selectedIcon: AppAssets.volumeHigh,
                                    unSelectedIcon: AppAssets.volumeCross,
                                    onTap: () {
                                      setState(() {
                                        radioMuted = !radioMuted;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: AppColors.gold,
                        ),
                        width: 390.w,
                        child: Stack(
                          children: [
                            reciterPlaying
                                ? Positioned(
                                    top: 79.h,
                                    right: 1.w,
                                    left: 2.w,
                                    child: Image.asset(
                                      AppAssets.rectangle,
                                      fit: BoxFit.cover,
                                      color: AppColors.black,
                                    ),
                                  )
                                : Positioned(
                                    top: 15.h,
                                    child: Image.asset(
                                      AppAssets.imgBottomDecoration,
                                      fit: BoxFit.fill,
                                      color: AppColors.black,
                                    ),
                                  ),

                            Positioned(
                              top: 10.h,
                              right: 95.w,
                              child: Center(
                                child: Text(
                                  "Ibrahim Al-Akdar",
                                  style: AppStyle.bold20bl,
                                ),
                              ),
                            ),

                            Positioned(
                              top: 70.h,
                              left: 225.w,
                              child: Row(
                                children: [
                                  CustomRadioIcon(
                                    isSelected: reciterPlaying,
                                    selectedIcon: AppAssets.paley,
                                    unSelectedIcon: AppAssets.stop,
                                    onTap: () {
                                      setState(() {
                                        reciterPlaying = !reciterPlaying;
                                      });
                                    },
                                  ),

                                  SizedBox(width: 20.w),

                                  CustomRadioIcon(
                                    isSelected: reciterMuted,
                                    selectedIcon: AppAssets.volumeHigh,
                                    unSelectedIcon: AppAssets.volumeCross,
                                    onTap: () {
                                      setState(() {
                                        reciterMuted = !reciterMuted;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
