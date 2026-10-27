import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/%20provider/mostRecentProvider.dart';
import 'package:islami_app/Ui/screen/home/tabs/quran/quranDetails%20.dart';
import 'package:islami_app/notification_service/notification_service.dart';
import 'package:provider/provider.dart';
import 'package:islami_app/Ui/IntroScreen/IntroScreen.dart';
import 'package:islami_app/Ui/screen/home/homescreen.dart';
import 'package:islami_app/Ui/screen/home/tabs/quran/quranDetails2.dart';
import 'package:islami_app/uitils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool onBoarDing = prefs.getBool('onBoarDing')??false;
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.instance.initialize();
  await NotificationService.testAdhanAfterOneMinute();
  runApp(
    ChangeNotifierProvider(
      create: (_) => MostRecentProvider(),
      child: MyApp(onBoarDing: onBoarDing,),
    ),

  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key,required this.onBoarDing});
bool onBoarDing;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        initialRoute: onBoarDing
            ? AppRoutes.homeRouteName
            : AppRoutes.introRouteName,
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
