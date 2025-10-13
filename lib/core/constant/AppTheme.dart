import 'package:flutter/material.dart';

import 'AppColor.dart';

ThemeData themeEnglish = ThemeData.light().copyWith(
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Kcolor().KlightBlueAccent,
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Kcolor().KlightBlueAccent,
    ),
  ),
); //them i put i want
ThemeData themeArabic = ThemeData.light().copyWith(); //them i put i want
