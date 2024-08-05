import 'package:ecomerce1/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChange(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: ((context, i) => Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  "${onBoardingList[i].images}",
                  //width:360 ,
                  height: Get.width / 1.9,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text("${onBoardingList[i].title}",
                    style: Theme.of(context).textTheme.displayLarge),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text("${onBoardingList[i].body}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge),
                )
              ],
            )));
  }
}
