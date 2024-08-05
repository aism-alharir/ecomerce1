import 'package:ecomerce1/controller/cart_controller.dart';
import 'package:ecomerce1/core/class/handlingdataview.dart';
import 'package:ecomerce1/view/widget/cart/bottom_navgation_bar_cart.dart';
import 'package:ecomerce1/view/widget/cart/custom_items-cart-list.dart';
import 'package:ecomerce1/view/widget/cart/top_card_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Cart"),
        ),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => BottomNavgationBarCart(
            controllercoupon: controller.controllercoupon!,
            onApplayCoupon: () {
              controller.checkCopoun();
            },
            Price: "${controller.priceOrders}",
            discount: "${controller.discountcoupon}%",
            TotalPrice: "${controller.getTotalPrice()}\$",
            shipping: '10',
          ),
        ),
        body: GetBuilder<CartController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TopCardCart(
                      message:
                          "You Have ${controller.totleCountItems.toString()} Items in Your List"),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ...List.generate(
                          controller.data.length,
                          (index) => CustomItemsCartList(
                            name: "${controller.data[index].itemsName}",
                            price: "${controller.data[index].itemsprice}",
                            count: "${controller.data[index].countitems}",
                            imageName: '${controller.data[index].itemsImage}',
                            onAdd: () async {
                              await controller.add(
                                  controller.data[index].itemsId.toString());
                              controller.refreshPage();
                            },
                            onRemove: () async {
                              await controller.delete(
                                  controller.data[index].itemsId.toString());
                              controller.refreshPage();
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
