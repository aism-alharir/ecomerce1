import 'package:ecomerce1/core/class/statusrequest.dart';
import 'package:ecomerce1/core/functions/handlingdatacontroller.dart';
import 'package:ecomerce1/data/model/cart_model.dart';
import 'package:ecomerce1/data/model/order_model.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/orders/details.dart';

class OrdersDetailsController extends GetxController {
  late OrderModel orderModel;
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  List<CartModel> data = [];
  late StatusRequest statusRequest;

  @override
  void onInit() {
    orderModel = Get.arguments['ordersModel'];
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await ordersDetailsData.getData(orderModel.ordersId.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
