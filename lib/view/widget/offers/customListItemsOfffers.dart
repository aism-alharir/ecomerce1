import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce1/controller/favorite_controller.dart';
import 'package:ecomerce1/controller/offers_controller.dart';
import 'package:ecomerce1/core/constant/color.dart';
import 'package:ecomerce1/core/constant/imageasset.dart';
import 'package:ecomerce1/core/functions/translatedatabase.dart';
import 'package:ecomerce1/data/model/itemsmodel.dart';
import 'package:ecomerce1/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItemsOffers extends GetView<OffersController> {
  final ItemsModel itemsModel;
  const CustomListItemsOffers({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "${itemsModel.itemsId}",
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppLink.imagesItems}/${itemsModel.itemsImage}",
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
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     const Text(
                      //       "Rating",
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(fontSize: 14),
                      //     ),
                      //     Container(
                      //       alignment: Alignment.bottomCenter,
                      //       height: 10,
                      //       child: Row(
                      //         children: [
                      //           ...List.generate(
                      //               5,
                      //               (index) => const Icon(
                      //                     Icons.star,
                      //                     size: 17,
                      //                   ))
                      //         ],
                      //       ),
                      //     )
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${itemsModel.itemsPriceDiscount} \$",
                            style: const TextStyle(
                                fontSize: 16,
                                color: AppColor.primaryColor,
                                fontFamily: "sans"),
                          ),
                          GetBuilder<FavoriteController>(
                            builder: (controller) => IconButton(
                                onPressed: () {
                                  if (controller
                                          .isFavorite[itemsModel.itemsId] ==
                                      1) {
                                    controller.setFavorite(
                                        itemsModel.itemsId, 0);
                                    controller.removeFavorite(
                                        itemsModel.itemsId.toString());
                                  } else {
                                    controller.setFavorite(
                                        itemsModel.itemsId, 1);
                                    controller.addFavorite(
                                        itemsModel.itemsId.toString());
                                  }
                                },
                                icon: Icon(
                                  controller.isFavorite[itemsModel.itemsId] == 1
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: AppColor.primaryColor,
                                )),
                          )
                        ],
                      ),
                    ]),
                if (itemsModel.itemsDiscount != 0)
                  Positioned(
                    left: 2,
                    top: 2,
                    child: Image.asset(
                      AppImageAsset.sale,
                      width: 40,
                      // height: 40,
                    ),
                  )
              ],
            )),
      ),
    );
  }
}
