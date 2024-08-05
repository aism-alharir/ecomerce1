import 'package:ecomerce1/core/constant/appTheme.dart';
import 'package:ecomerce1/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleControllere extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish;

  changelanguage(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    appTheme = langCode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }

    super.onInit();
  }
}
