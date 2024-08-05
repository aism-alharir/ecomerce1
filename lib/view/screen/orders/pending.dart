import 'package:ecomerce1/controller/orders/pending_controller.dart';
import 'package:ecomerce1/core/class/handlingdataview.dart';
import 'package:ecomerce1/view/widget/orders/OrdersListCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order"),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrdersPendingController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) =>
                          CardOrdersList(listdata: controller.data[index]),
                    ),
                  ))),
    );
  }
}
