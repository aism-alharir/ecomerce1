import 'package:ecomerce1/controller/cart_controller.dart';
import 'package:ecomerce1/view/screen/home.dart';
import 'package:ecomerce1/view/screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screen/offers.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
}

class HomeScreenControllerImp extends HomeScreenController {
  CartController cartController = Get.put(CartController());
  int cureentPage = 0;
  List<Widget> listPage = [
    const HomePage(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("settings"))],
    ),
    const OffersView(),
    const Setting(),
  ];
  List buttonAppBar = [
    {"title": "home", "icon": Icons.home},
    {"title": "notifications", "icon": Icons.notifications_active_outlined},
    {"title": "Offers", "icon": Icons.discount_outlined},
    {"title": "setting", "icon": Icons.settings},
  ];

  @override
  changePage(int index) {
    cureentPage = index;
    update();
  }
}
