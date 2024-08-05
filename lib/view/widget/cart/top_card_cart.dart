import 'package:ecomerce1/core/constant/color.dart';
import 'package:flutter/material.dart';

class TopCardCart extends StatelessWidget {
  final String message;
  const TopCardCart({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 4),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColor.thirdColor),
      child: Text(message,
          style: const TextStyle(color: AppColor.primaryColor),
          textAlign: TextAlign.center),
    );
  }
}
