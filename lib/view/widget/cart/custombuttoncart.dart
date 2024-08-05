import 'package:ecomerce1/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonCart extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CustomButtonCart(
      {Key? key, required this.textButton, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: MaterialButton(
          onPressed: onPressed,
          textColor: Colors.white,
          color: AppColor.primaryColor,
          child: Text(
            textButton,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
    );
  }
}
