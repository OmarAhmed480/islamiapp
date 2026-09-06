import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/%20provider/mostRecentProvider.dart';
import 'package:islami_app/Ui/screen/home/tabs/quran/quranDetails%20.dart';
import 'package:provider/provider.dart';

import 'package:islami_app/Ui/IntroScreen/IntroScreen.dart';
import 'package:islami_app/Ui/screen/home/homescreen.dart';
import 'package:islami_app/Ui/screen/home/tabs/quran/quranDetails2.dart';
import 'package:islami_app/uitils/app_routes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MostRecentProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        initialRoute: AppRoutes.introRouteName,

        routes: {
          AppRoutes.introRouteName: (context) => OnBoardingPage(),

          AppRoutes.homeRouteName: (context) => HomeScreen(),

          AppRoutes.quranDetailsRouteName: (context) => QuranDetails(),

          AppRoutes.quranDetails2RouteName: (context) => QuranDetails2(),
        },
      ),
    );
  }
}
