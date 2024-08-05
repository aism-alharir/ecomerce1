import 'package:ecomerce1/core/class/statusrequest.dart';
import 'package:ecomerce1/core/constant/routes.dart';
import 'package:ecomerce1/core/functions/handlingdatacontroller.dart';
import 'package:ecomerce1/core/services/services.dart';
import 'package:ecomerce1/data/datasource/remote/address-data.dart';
import 'package:ecomerce1/data/datasource/remote/checkout_data.dart';
import 'package:ecomerce1/data/model/address_model.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  String? paymentMethod;
  String? deliveryType;
  String addressid = "0";
  StatusRequest statusRequest = StatusRequest.none;
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  MyServices myServices = Get.find();
  List<AddressModel> dataAddress = [];
  late var priceOrders;
  late String couponid;
  late String coupondiscount;
  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        dataAddress.addAll(listData.map((e) => AddressModel.fromJson(e)));
        addressid = dataAddress[0].addressId.toString();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please select a payment method");
    }

    if (deliveryType == null) {
      return Get.snackbar("Error", "Please select a order type");
    }

    if (dataAddress.isEmpty) {
      return Get.snackbar("Error", "Please select Shipping Address");
    }

    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "addressid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10",
      "ordersprice": priceOrders,
      "couponid": couponid,
      "coupondiscount": coupondiscount.toString(),
      "paymentmethod": paymentMethod.toString(),
    };
    var response = await checkoutData.checkout(data);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.homePage);
        Get.snackbar("Success", "the order was successfuly");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "try again");
      }
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceOrders = Get.arguments['priceorder'];
    coupondiscount = Get.arguments['discountcoupon'].toString();
    getShippingAddress();
    super.onInit();
  }
}
