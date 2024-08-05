import 'package:ecomerce1/core/class/statusrequest.dart';
import 'package:ecomerce1/core/constant/routes.dart';
import 'package:ecomerce1/core/functions/handlingdatacontroller.dart';
import 'package:ecomerce1/core/services/services.dart';
import 'package:ecomerce1/data/datasource/remote/address-data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAddController extends GetxController {
  TextEditingController? city;
  TextEditingController? street;
  TextEditingController? name;
  String? lat;
  String? long;

  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    initalData();
    super.onInit();
  }

  initalData() {
    city = TextEditingController();
    street = TextEditingController();
    name = TextEditingController();
    lat = "23.7632";
    long = "72.2326262";

    print(lat);
    print(long);
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addData(
        myServices.sharedPreferences.getString("id")!,
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.homePage);
        Get.snackbar("Error", "You Can Order to This address");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
