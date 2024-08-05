import 'package:ecomerce1/controller/cart_controller.dart';
import 'package:ecomerce1/core/class/statusrequest.dart';
import 'package:ecomerce1/core/functions/handlingdatacontroller.dart';
import 'package:ecomerce1/core/services/services.dart';
import 'package:ecomerce1/data/datasource/remote/cart_data.dart';
import 'package:ecomerce1/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  initialData();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;
  CartController cartController = Get.put(CartController());
  List subItems = [
    {"name": "red", "id": "1", "active": "0"},
    {"name": "green", "id": "2", "active": "1"},
    {"name": "blue", "id": "3", "active": "0"},
  ];
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  late StatusRequest statusRequest;
  int countItems = 0;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsModel'];
    countItems = await getCountItems(itemsModel.itemsId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  addItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "53".tr,
          messageText: Text("56".tr),
        );
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "53".tr,
          messageText: Text("57".tr),
        );
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountItems(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countItems = 0;
        countItems = response['data'];
        print("--------------");
        print(countItems);
        return countItems;
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  add() {
    addItems(itemsModel.itemsId.toString());
    countItems++;
    update();
  }

  remove() {
    if (countItems > 0) {
      deleteItems(itemsModel.itemsId.toString());
      countItems--;
      update();
    }
  }
}
