import 'package:ecomerce1/controller/productdetails_controller.dart';
import 'package:ecomerce1/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSubItemsList extends GetView<ProductDetailsControllerImp> {
  const CustomSubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subItems.length,
          (index) => Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.only(bottom: 8),
            alignment: Alignment.center,
            height: 60,
            width: 80,
            decoration: BoxDecoration(
                color: controller.subItems[index]["active"] == "1"
                    ? AppColor.fourthColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.fourthColor)),
            child: Text(
              "${controller.subItems[index]["name"]}",
              style: TextStyle(
                  fontSize: 16,
                  color: controller.subItems[index]["active"] == "1"
                      ? Colors.white
                      : AppColor.fourthColor),
            ),
          ),
        )
      ],
    );
  }
}
