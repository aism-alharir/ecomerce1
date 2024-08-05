import 'package:ecomerce1/controller/checkout_controller.dart';
import 'package:ecomerce1/core/class/handlingdataview.dart';
import 'package:ecomerce1/core/constant/color.dart';
import 'package:ecomerce1/core/constant/imageasset.dart';
import 'package:ecomerce1/core/constant/routes.dart';
import 'package:ecomerce1/view/widget/checkout/card_delivery_type.dart';
import 'package:ecomerce1/view/widget/checkout/card_payment%20_method.dart';
import 'package:ecomerce1/view/widget/checkout/card_shpping_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("CheckOut"),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: AppColor.primaryColor,
            textColor: Colors.white,
            onPressed: () {
              controller.checkout();
            },
            child: const Text(
              "Checkout",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: GetBuilder<CheckoutController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  const Text(
                    "Choose Payment Method",
                    style: TextStyle(
                        color: AppColor.soucondColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () {
                        controller.choosePaymentMethod("0"); //cash
                      },
                      child: CardPaymentMethodCheckout(
                          title: "Cash",
                          isActive:
                              controller.paymentMethod == "0" ? true : false)),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      controller.choosePaymentMethod("1"); // payment mehod
                    },
                    child: CardPaymentMethodCheckout(
                        title: "Payment Cards",
                        isActive:
                            controller.paymentMethod == "1" ? true : false),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Choose Delivery Type",
                    style: TextStyle(
                        color: AppColor.soucondColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.chooseDeliveryType("0"); //delivery
                        },
                        child: CardDeliveryTypeCheckout(
                            imageName: AppImageAsset.deliveryImage,
                            title: "Delivery",
                            active:
                                controller.deliveryType == "0" ? true : false),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      InkWell(
                        onTap: () {
                          controller.chooseDeliveryType("1"); // recive
                        },
                        child: CardDeliveryTypeCheckout(
                            imageName: AppImageAsset.deliverythruImage1,
                            title: "Revicr",
                            active:
                                controller.deliveryType == "1" ? true : false),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (controller.deliveryType == "0")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (controller.dataAddress.isNotEmpty)
                          const Text(
                            "Shipping Address",
                            style: TextStyle(
                                color: AppColor.soucondColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        if (controller.dataAddress.isEmpty)
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.addressView);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                "Please Add Shipping Address \n Click Here",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        ...List.generate(
                          controller.dataAddress.length,
                          (index) => InkWell(
                            onTap: () {
                              controller.chooseShippingAddress(controller
                                  .dataAddress[index].addressId
                                  .toString());
                            },
                            child: CardShppingAddressCheckout(
                                title:
                                    "${controller.dataAddress[index].addressName}",
                                body:
                                    "${controller.dataAddress[index].addressCity} ${controller.dataAddress[index].addressStreet}",
                                isActive: controller.addressid ==
                                        controller.dataAddress[index].addressId
                                            .toString()
                                    ? true
                                    : false),
                          ),
                        )
                      ],
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}
