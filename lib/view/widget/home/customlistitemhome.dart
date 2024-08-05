import 'package:ecomerce1/controller/home_controller.dart';
import 'package:ecomerce1/core/constant/color.dart';
import 'package:ecomerce1/data/model/itemsmodel.dart';
import 'package:ecomerce1/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListTitleHome extends GetView<HomeControllerImp> {
  const CustomListTitleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.items.length,
          itemBuilder: (context, index) => ItemsHome(
              itemsModel: ItemsModel.fromJson(controller.items[index]))),
    );
  }
}

class ItemsHome extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;
  const ItemsHome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goTOPageProductDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.network(
              "${AppLink.imagesItems}/${itemsModel.itemsImage}",
              height: 100,
              width: 150,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: 120,
            width: 200,
            decoration: BoxDecoration(
                color: AppColor.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
          ),
          Positioned(
            left: 10.0,
            child: Text("${itemsModel.itemsName}",
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          )
        ],
      ),
    );
  }
}
