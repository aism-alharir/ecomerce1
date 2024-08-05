import 'dart:io';

import 'package:ecomerce1/controller/homescreen_controller.dart';
import 'package:ecomerce1/core/constant/color.dart';
import 'package:ecomerce1/core/constant/routes.dart';
import 'package:ecomerce1/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenControllerImp controllerImp = Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: ((controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
                backgroundColor: AppColor.primaryColor,
                onPressed: () {
                  controllerImp.cartController.refreshPage();
                  Get.toNamed(AppRoutes.cart);
                },
                child: const Icon(Icons.shopping_basket_outlined)),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const CustomBottomAppBarHome(),
            body: WillPopScope(
              child: controller.listPage.elementAt(controller.cureentPage),
              onWillPop: () {
                Get.defaultDialog(
                  title: "Warning",
                  middleText: "Do You Want To Exit The app",
                  titleStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor),
                  middleTextStyle: const TextStyle(color: AppColor.grey2),
                  cancelTextColor: AppColor.soucondColor,
                  buttonColor: AppColor.thirdColor,
                  confirmTextColor: AppColor.soucondColor,
                  onCancel: () {},
                  onConfirm: () {
                    exit(0);
                  },
                );
                return Future.value(false);
              },
            ))));
  }
}
