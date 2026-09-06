import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/uitils/app_assets.dart';
import 'package:islami_app/uitils/app_colors.dart';
import 'package:islami_app/uitils/app_style.dart';

class HadithCard extends StatefulWidget {
  final String hadithNumber;
  final String hadithText;
  int index;

  HadithCard({
    super.key,
    required this.hadithNumber,
    required this.hadithText,
    required this.index,
  });

  @override
  State<HadithCard> createState() => _HadithCardState();
}

class _HadithCardState extends State<HadithCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(bottom: 20.h),
      child: Container(
        height: 618.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.gold,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 80.h),
                child: Image.asset(
                  AppAssets.hadithCardBack,
                  width: 313.w,
                  height: 428.h,
                  fit: BoxFit.fill,
                  color: AppColors.black,
                ),
              ),
            ),

            Positioned(
              top: 10.h,
              left: 10.w,
              right: 10.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AppAssets.leftCorner,
                    fit: BoxFit.fill,
                    color: AppColors.black,
                  ),

                  Expanded(
                    child: Text(
                      widget.hadithNumber,
                      textAlign: TextAlign.center,
                      style: AppStyle.bold24bl,
                    ),
                  ),

                  Image.asset(
                    AppAssets.rightCorner,
                    fit: BoxFit.fill,
                    color: AppColors.black,
                  ),
                ],
              ),
            ),

            Positioned(
              top: 120.h,
              left: 35.w,
              right: 35.w,
              bottom: 150.h,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Text(
                  widget.hadithText,
                  textAlign: TextAlign.center,
                  style: AppStyle.bold14bl.copyWith(color: AppColors.black),
                ),
              ),
            ),

            Positioned(
              top: 462.h,
              right: 10.w,
              child: Image.asset(
                AppAssets.imgBottomDecoration,
                color: AppColors.black,
                height: 88.5,
                width: 312.w,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
