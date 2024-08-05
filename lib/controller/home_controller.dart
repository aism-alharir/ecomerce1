import 'package:ecomerce1/core/class/statusrequest.dart';
import 'package:ecomerce1/core/constant/routes.dart';
import 'package:ecomerce1/core/functions/handlingdatacontroller.dart';
import 'package:ecomerce1/core/services/services.dart';
import 'package:ecomerce1/data/datasource/remote/home.dart';
import 'package:ecomerce1/data/datasource/remote/search_data.dart';
import 'package:ecomerce1/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends SearchMixController {
  initialData();
  getData();
  goToItems(List categories, int selectedCategories, String categoriesid);
  goToPageMyFavorite();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? username;
  String? id;
  String? lang;
  HomeData homeData = HomeData(Get.find());
  String titleHomeCard = "";
  String bodyHomeCard = "";
  String deliveryTime = "";

  //List data = [];
  List categories = [];
  List items = [];
  Map settingData = {};

  @override
  void onInit() {
    search = TextEditingController();
    initialData();
    getData();
    super.onInit();
  }

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
    lang = myServices.sharedPreferences.getString("lang");
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        settingData.addAll(response['settings']['data']);
        titleHomeCard = settingData['settings_titlehome'];
        bodyHomeCard = settingData['settings_bodyhome'];
        deliveryTime = settingData['settings_deliverytime'].toString();
        myServices.sharedPreferences.setString("deliveryTime", deliveryTime);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCategories, categoriesid) {
    Get.toNamed(AppRoutes.items, arguments: {
      "categories": categories,
      "selectedCategories": selectedCategories,
      "categoriesid": categoriesid
    });
  }

  @override
  goToPageMyFavorite() {
    Get.toNamed(AppRoutes.myFavorite);
  }

  goTOPageProductDetails(itemsModel) {
    Get.toNamed(AppRoutes.productDetails,
        arguments: {"itemsModel": itemsModel});
  }
}

class SearchMixController extends GetxController {
  SearchData searchData_ = SearchData(Get.find());
  late StatusRequest statusRequest;
  TextEditingController? search;
  List<ItemsModel> listData = [];
  bool isSearch = false;
  chechSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await searchData_.searchData(search!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listData.clear();
        List responsebody = response['data'];
        listData.addAll(responsebody.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
