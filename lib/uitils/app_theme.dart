import 'package:flutter/material.dart';


import 'app_colors.dart';

class AppTheme {

  static final ThemeData darkThem=ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: AppColors.black,
    centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.gold),),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.gold,
     ),


  );


}