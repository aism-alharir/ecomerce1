import 'package:ecomerce1/core/constant/routes.dart';
import 'package:ecomerce1/core/services/services.dart';
import 'package:ecomerce1/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChange(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int curentPage = 0;

  MyServices myServices = Get.find();
  @override
  next() {
    curentPage++;
    if (curentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("onboarding", "1");
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(curentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  
  }

  @override
  onPageChange(int index) {
    curentPage = index;
    update();
  
  }

  @override
  void onInit() {
    pageController = PageController();

    super.onInit();
  }
}
