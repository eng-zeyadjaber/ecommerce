import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "PlayfairDisplay",
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 22,
      fontFamily: "Cairo",
      fontWeight: FontWeight.bold,
      color: AppTextColor.white,
    ),
    bodyLarge: TextStyle(
      height: 2,
      color: AppTextColor.body,
      fontFamily: "Cairo",
    ),
  ),
  primarySwatch: Colors.blue,
);

////////////////////////////////////////////////////////////////////

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 22,
      fontFamily: "Cairo",
      fontWeight: FontWeight.bold,
      color: AppTextColor.white,
    ),
    bodyLarge: TextStyle(
      height: 2,
      color: AppTextColor.body,
      fontFamily: "Cairo",
    ),
  ),
  primarySwatch: Colors.blue,
);