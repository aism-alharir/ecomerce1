import 'package:ecomerce1/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomPriceAndcount extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String count;
  final String price;
  const CustomPriceAndcount(
      {super.key,
      required this.onAdd,
      required this.onRemove,
      required this.count,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: onAdd,
              icon: const Icon(Icons.add),
              iconSize: 30,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 1),
              alignment: Alignment.center,
              width: 50,
              //height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.black,
                ),
              ),
              child:  Text(
                count,
                textAlign: TextAlign.center,
                style: const TextStyle(height: 1.1, fontSize: 20, fontFamily: "sans"),
              ),
            ),
            IconButton(
              onPressed: onRemove,
              icon: const Icon(Icons.remove),
              iconSize: 30,
            )
          ],
        ),
        const Spacer(),
         Text(
          "$price \$",
          style: const TextStyle(
              height: 1.1,
              fontSize: 20,
              color: AppColor.primaryColor,
              fontFamily: "sans"),
        )
      ],
    );
  }
}
