import 'package:ecomerce1/controller/homescreen_controller.dart';
import 'package:ecomerce1/view/widget/home/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(builder: ((controller) {
      return BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            children: [
              ...List.generate(controller.listPage.length + 1, (index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : CustomButtonAppBar(
                        onPressed: () {
                          controller.changePage(i);
                        },
                        textbutton: "${controller.buttonAppBar[i]["title"]}",
                        iconData: controller.buttonAppBar[i]["icon"],
                        active: controller.cureentPage == i ? true : false);
              })
            ],
          ));
    }));
  }
}
