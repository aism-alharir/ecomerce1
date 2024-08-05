import 'package:ecomerce1/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardDeliveryTypeCheckout extends StatelessWidget {
  final String imageName;
  final String title;
  final bool active;
  const CardDeliveryTypeCheckout(
      {super.key,
      required this.imageName,
      required this.title,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
          color: active ? AppColor.primaryColor : null,
          border: Border.all(color: AppColor.soucondColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageName,
            width: 80,
          ),
          Text(
            title,
            style: TextStyle(
                color: active ? Colors.white : AppColor.primaryColor,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
