import 'package:ecomerce1/controller/onboarding_controller.dart';
import 'package:ecomerce1/core/constant/color.dart';
import 'package:ecomerce1/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: ((controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 900),
                          margin: const EdgeInsets.only(right: 5),
                          width: controller.curentPage == index ? 20 : 5,
                          height: 6,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.primaryColor),
                        ))
              ],
            )));
  }
}
