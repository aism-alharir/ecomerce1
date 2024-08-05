import 'package:ecomerce1/core/class/statusrequest.dart';
import 'package:ecomerce1/core/constant/routes.dart';
import 'package:ecomerce1/core/functions/handlingdatacontroller.dart';
import 'package:ecomerce1/core/services/services.dart';
import 'package:ecomerce1/data/datasource/remote/cart_data.dart';
import 'package:ecomerce1/data/model/cart_model.dart';
import 'package:ecomerce1/data/model/copoun_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  late StatusRequest statusRequest;
  List<CartModel> data = [];
  var priceOrders;
  int totleCountItems = 0;
  TextEditingController? controllercoupon;
  CopounModel? copounModel;

  int? discountcoupon = 0;
  String? couponname;
  String? couponid;

  add(String itemsid) async {
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

  goToPageCheckout() {
    if (data.isEmpty) return Get.snackbar("تنبيه", "السلة فارغة");
    Get.toNamed(AppRoutes.checkout, arguments: {
      "couponid": couponid ?? "0",
      "priceorder": priceOrders.toString(),
      "discountcoupon": discountcoupon.toString()
    });
  }

  getTotalPrice() {
    return (priceOrders - priceOrders * discountcoupon! / 100);
  }

  delete(String itemsid) async {
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

  checkCopoun() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCopoun(controllercoupon!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> dataCoupon = response['data'];
        copounModel = CopounModel.fromJson(dataCoupon);
        discountcoupon = copounModel!.couponDiscount;
        couponname = copounModel!.couponName;
        couponid = copounModel!.couponId.toString();
      } else {
        // statusRequest = StatusRequest.failure;
        discountcoupon = 0;
        couponname = null;
        couponid = null;
        Get.snackbar("Error", "Copoun Not Vaild");
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

  resetVaraibleCart() {
    totleCountItems = 0;
    priceOrders = 0;
    data.clear();
  }

  refreshPage() {
    resetVaraibleCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      //start backend
      if (response['status'] == "success") {
        if (response['datacart']['status'] == "success") {
          List responseData = response['datacart']['data'];
          Map dataResponseCountPrice = response['countprice'];
          data.clear();
          data.addAll(responseData.map((e) => CartModel.fromJson(e)));
          totleCountItems = int.parse(dataResponseCountPrice['totalcount']);
          priceOrders = dataResponseCountPrice['totalprice'];
          // priceOrders = double.parse(dataResponseCountPrice['totalprice']);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    view();
    super.onInit();
  }
}
