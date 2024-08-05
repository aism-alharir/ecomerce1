// ignore_for_file: prefer_const_constructors

import 'package:ecomerce1/controller/cart_controller.dart';
import 'package:ecomerce1/core/constant/color.dart';
import 'package:ecomerce1/view/widget/cart/custombuttoncart.dart';
import 'package:ecomerce1/view/widget/cart/custombuttoncopoun.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavgationBarCart extends GetView<CartController> {
  final String Price;
  final String discount;
  final String shipping;
  final String TotalPrice;
  final TextEditingController controllercoupon;
  final void Function()? onApplayCoupon;
  const BottomNavgationBarCart(
      {super.key,
      required this.Price,
      required this.discount,
      required this.shipping,
      required this.TotalPrice,
      required this.controllercoupon,
      this.onApplayCoupon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(
              builder: (controller) => controller.couponname == null
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: controllercoupon,
                                decoration: InputDecoration(
                                    hintText: "Coupon Code",
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 10)),
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: CustomButtonCoupon(
                              textButton: "apply",
                              onPressed: onApplayCoupon,
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(
                      child: Text(
                        "Coupon Code ${controller.couponname}",
                        style: TextStyle(
                            fontSize: 17,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryColor, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Price",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        Price,
                        style: TextStyle(fontSize: 16, fontFamily: "sans"),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "discount",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        discount,
                        style:
                            const TextStyle(fontSize: 16, fontFamily: "sans"),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "shipping",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        shipping,
                        style:
                            const TextStyle(fontSize: 16, fontFamily: "sans"),
                      ),
                    )
                  ],
                ),
                const Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Total Price",
                        style: TextStyle(
                            fontFamily: "sans",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        TotalPrice,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButtonCart(
            textButton: "Oreder",
            onPressed: () {
              controller.goToPageCheckout();
            },
          )
        ],
      ),
    );
  }
}
