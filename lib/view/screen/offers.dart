import 'package:ecomerce1/controller/favorite_controller.dart';
import 'package:ecomerce1/controller/offers_controller.dart';
import 'package:ecomerce1/core/class/handlingdataview.dart';
import 'package:ecomerce1/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/customappbar.dart';
import '../widget/offers/customListItemsOfffers.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return GetBuilder<OffersController>(
        builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  CustomAppBar(
                    titleappbar: "49".tr,
                    onPressedIconFavorite: () {
                      controller.goToPageMyFavorite();
                    },
                    onPressedSearch: () {
                      controller.onSearchItems();
                    },
                    myController: controller.search,
                    onChanged: (val) {
                      controller.chechSearch(val);
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  !controller.isSearch
                      ? HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) =>
                                CustomListItemsOffers(
                                    itemsModel: controller.data[index]),
                          ))
                      : ListItemsSearch(listDataModel: controller.listData)
                ],
              ),
            ));
  }
}
