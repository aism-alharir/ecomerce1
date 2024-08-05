import 'package:ecomerce1/core/constant/routes.dart';
import 'package:ecomerce1/core/localization/changelocale.dart';
import 'package:ecomerce1/view/widget/language/custombuttonlanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleControllere> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr, style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(
              height: 15,
            ),
            CustomButtonLanguage(
              textButton: "Ar",
              onPressed: () {
                controller.changelanguage("ar");
                Get.toNamed(AppRoutes.onBoarding);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButtonLanguage(
                textButton: "En",
                onPressed: () {
                  controller.changelanguage("en");
                  Get.toNamed(AppRoutes.onBoarding);
                })
          ],
        ),
      ),
    );
  }
}
