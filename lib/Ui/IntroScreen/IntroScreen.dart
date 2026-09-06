import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/uitils/app_assets.dart';
import 'package:islami_app/uitils/app_colors.dart';
import 'package:islami_app/uitils/app_routes.dart';
import 'package:islami_app/uitils/app_style.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);
  }

  Widget _buildImage(String assetName) {
    return Image.asset(assetName,fit: BoxFit.cover, );
  }

  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      titleTextStyle: AppStyle.bold24Gold,
      bodyTextStyle: AppStyle.bold20Gold,
      imagePadding: REdgeInsets.only(left: 16, right: 16, top: 200),
      titlePadding: REdgeInsets.only(right: 16,left: 16),
      imageFlex: 4,
      bodyFlex: 1,
      imageAlignment: Alignment.center,
      bodyAlignment: Alignment.topCenter,

      pageColor: AppColors.black,
    );
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: AppColors.black,
      globalHeader: Align(
        alignment: Alignment.topCenter,
        child: SafeArea(child: _buildImage(AppAssets.globalHeader)),
      ),
      pages: [
        PageViewModel(
          title: "Welcome To Islmi App",
          body: "",

          image: _buildImage(AppAssets.introScreen_1),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome To Islami",
          body: "We Are Very Excited To Have You In Our Community",
          image: _buildImage(AppAssets.introScreen_2),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Reading the Quran",
          body: "Read, and your Lord is the Most Generous",
          image: _buildImage(AppAssets.introScreen_3),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Praising Allah",
          body: "Praise the name of your Lord, the Most High",
          image: _buildImage(AppAssets.introScreen_4),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Holy Quran Radio",
          body:
              "You can listen to the Holy Quran Radio through the application for free and easily",
          image: _buildImage(AppAssets.introScreen_5),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      // You can override onSkip callback
      showBackButton: true,
      showSkipButton: true,
      back: Text(
        'Back',
        style: AppStyle.bold16w.copyWith(color: AppColors.gold),
      ),
      next: Text(
        'Next',
        style: AppStyle.bold16w.copyWith(color: AppColors.gold),
      ),
      done: Text(
        'Finish',
        style: AppStyle.bold16w.copyWith(color: AppColors.gold),
      ),
      skip:Text(
        'skip',
        style: AppStyle.bold16w.copyWith(color: AppColors.gold),
      ) ,
      curve: Curves.easeInOut,
      controlsPadding: REdgeInsets.symmetric(vertical: 50),
      dotsDecorator: DotsDecorator(
        size: Size(7.w, 7.h),
        color: AppColors.gray,
        activeColor: AppColors.gold,
        activeSize: Size(18.w, 7.h),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
