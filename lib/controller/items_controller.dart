import 'package:ecomerce1/controller/home_controller.dart';
import 'package:ecomerce1/core/class/statusrequest.dart';
import 'package:ecomerce1/core/constant/routes.dart';
import 'package:ecomerce1/core/functions/handlingdatacontroller.dart';
import 'package:ecomerce1/core/services/services.dart';
import 'package:ecomerce1/data/datasource/remote/items.dart';
import 'package:ecomerce1/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends SearchMixController {
  initialData();
  changeCategories(int val, String categoriesval);
  getData(String categoriesid);
  goTOPageProductDetails(ItemsModel itemsModel);
  goToPageMyFavorite();
}

class ItemsControllerImp extends ItemsController {
  MyServices myServices = Get.find();
  List categories = [];
  int? selectedCategories;
  String? categoriesid;
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  String deliveryTime = "";

  @override
  void onInit() {
    search = TextEditingController();
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    deliveryTime = myServices.sharedPreferences.getString("deliveryTime")!;
    categories = Get.arguments['categories'];
    selectedCategories = Get.arguments['selectedCategories'];
    categoriesid = Get.arguments['categoriesid'];
    getData(categoriesid!);
  }

  @override
  changeCategories(val, categoriesval) {
    selectedCategories = val;
    categoriesid = categoriesval;
    getData(categoriesid!);
    update();
  }

  @override
  getData(categoriesid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        categoriesid, myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goTOPageProductDetails(itemsModel) {
    Get.toNamed(AppRoutes.productDetails,
        arguments: {"itemsModel": itemsModel});
  }

  @override
  goToPageMyFavorite() {
    Get.toNamed(AppRoutes.myFavorite);
  }
}
