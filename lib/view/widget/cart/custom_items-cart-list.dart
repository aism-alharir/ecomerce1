import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce1/core/constant/color.dart';
import 'package:ecomerce1/linkapi.dart';
import 'package:flutter/material.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imageName;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomItemsCartList(
      {super.key,
      required this.name,
      required this.price,
      required this.count,
      required this.imageName,
      required this.onAdd,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: "${AppLink.imagesItems}/$imageName",
                height: 80,
                //fit: BoxFit.cover,
              )),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                subtitle: Text(
                  price,
                  style: const TextStyle(
                      fontSize: 15,
                      fontFamily: "sans",
                      color: AppColor.primaryColor),
                ),
              )),
          Expanded(
              child: Column(
            children: [
              Container(
                height: 35,
                child:
                    IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
              ),
              Container(
                height: 30,
                child: Text(
                  count,
                  style: const TextStyle(fontFamily: "sans"),
                ),
              ),
              Container(
                height: 25,
                child: IconButton(
                    onPressed: onRemove, icon: const Icon(Icons.remove)),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
