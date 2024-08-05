import 'package:ecomerce1/core/constant/color.dart';
import 'package:flutter/material.dart';

//theme English
ThemeData themeEnglish = ThemeData(
    appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColor.primaryColor),
        titleTextStyle: TextStyle(
          color: AppColor.primaryColor,
          fontSize: 25,
          fontFamily: "Cairo",
          fontWeight: FontWeight.bold
        ),
        backgroundColor: Colors.grey[50]),
    fontFamily: "Playfair_Display",
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryColor),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      displayMedium: TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 13),
    ));
// theme aribe
ThemeData themeArabic = ThemeData(
    fontFamily: "Cairo",
    appBarTheme: const AppBarTheme(color: AppColor.primaryColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryColor),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      displayMedium: TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 13),
    ));
