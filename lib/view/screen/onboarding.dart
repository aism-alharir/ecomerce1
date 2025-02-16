import 'package:ecomerce1/controller/onboarding_controller.dart';
import 'package:ecomerce1/view/widget/onboarding/custombutton.dart';
import 'package:ecomerce1/view/widget/onboarding/customslider.dart';
import 'package:ecomerce1/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
           Expanded(flex: 4, child: CustomSliderOnBoarding()),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomDotControllerOnBoarding(),
                  Spacer(
                    flex: 2,
                  ),
                  CustomButtonOnBoarding()
                ],
              ))
        ],
      )),
    );
  }
}
