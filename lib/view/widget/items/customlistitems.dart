import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce1/controller/favorite_controller.dart';
import 'package:ecomerce1/controller/items_controller.dart';
import 'package:ecomerce1/core/constant/color.dart';
import 'package:ecomerce1/core/constant/imageasset.dart';
import 'package:ecomerce1/core/functions/translatedatabase.dart';
import 'package:ecomerce1/data/model/itemsmodel.dart';
import 'package:ecomerce1/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goTOPageProductDetails(itemsModel);
      },
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
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: const Icon(
                              Icons.timer_sharp,
                              color: AppColor.grey,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${controller.deliveryTime} Mintue",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14, color: AppColor.grey2),
                          ),
                        ],
                      ),
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
