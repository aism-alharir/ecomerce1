import 'package:ecomerce1/controller/favorite_controller.dart';
import 'package:ecomerce1/controller/items_controller.dart';
import 'package:ecomerce1/core/class/handlingdataview.dart';
import 'package:ecomerce1/data/model/itemsmodel.dart';
import 'package:ecomerce1/view/screen/home.dart';
import 'package:ecomerce1/view/widget/customappbar.dart';
import 'package:ecomerce1/view/widget/items/customlistctaegoriesitems.dart';
import 'package:ecomerce1/view/widget/items/customlistitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends GetView<ItemsControllerImp> {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
   ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
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
              height: 20,
            ),
            const CustomListCategoriesItems(),
            GetBuilder<ItemsControllerImp>(
                builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget:!controller.isSearch ? GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (context, index) {
                        controllerFav.isFavorite[controller.data[index]
                            ['items_id']] = controller.data[index]['favorite'];
                        return CustomListItems(
                          itemsModel:
                              ItemsModel.fromJson(controller.data[index]),
                        );
                      },
                    ) : ListItemsSearch(listDataModel: controller.listData))
                    )
          ],
        ),
      ),
    );
  }
}
