import 'package:ecomerce1/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardShppingAddressCheckout extends StatelessWidget {
  final String title;
  final String body;
  final bool isActive;
  const CardShppingAddressCheckout(
      {super.key,
      required this.title,
      required this.body,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: isActive ? AppColor.primaryColor : null,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              color: isActive ? Colors.white : null,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          body,
          style: TextStyle(
              color: isActive ? Colors.white : null,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
