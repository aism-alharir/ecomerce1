import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce1/controller/myfavorite_controller.dart';
import 'package:ecomerce1/core/constant/color.dart';
import 'package:ecomerce1/core/functions/translatedatabase.dart';
import 'package:ecomerce1/data/model/myFavorite.dart';
import 'package:ecomerce1/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteController> {
  final MyFavoriteModel itemsModel;
  const CustomListFavoriteItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  controller.goTOPageProductDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: "${itemsModel.itemsId}",
                  child: CachedNetworkImage(
                    imageUrl: "${AppLink.imagesItems}/${itemsModel.itemsImage}",
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${translateDataBase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Rating",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 10,
                      child: Row(
                        children: [
                          ...List.generate(
                              5,
                              (index) => const Icon(
                                    Icons.star,
                                    size: 17,
                                  ))
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${itemsModel.itemsPrice} \$",
                      style: const TextStyle(
                          fontSize: 16,
                          color: AppColor.primaryColor,
                          fontFamily: "sans"),
                    ),
                    IconButton(
                        onPressed: () {
                          controller.deleteFromFavorite(
                              itemsModel.favoriteId.toString());
                        },
                        icon: const Icon(
                          Icons.delete_outline_outlined,
                          color: AppColor.primaryColor,
                        ))
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
