import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce1/controller/home_controller.dart';
import 'package:ecomerce1/core/class/handlingdataview.dart';
import 'package:ecomerce1/data/model/itemsmodel.dart';
import 'package:ecomerce1/linkapi.dart';
import 'package:ecomerce1/view/widget/customappbar.dart';
import 'package:ecomerce1/view/widget/home/customcardhome.dart';
import 'package:ecomerce1/view/widget/home/customlistcategorieshome.dart';
import 'package:ecomerce1/view/widget/home/customlistitemhome.dart';
import 'package:ecomerce1/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     HomeControllerImp controller =  Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: ((controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: const EdgeInsets.only(top: 15),
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
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: !controller.isSearch
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // if(controller.settingData.isNotEmpty)
                               CustomCardHome(
                                  title: controller.titleHomeCard,
                                  body: controller.bodyHomeCard),
                              CustomTitleHome(title: "52".tr),
                              const CustomListCategoriesHome(),
                              CustomTitleHome(title: "50".tr),
                              const CustomListTitleHome(),
                              // CustomTitleHome(title: "51".tr),
                              // const CustomListTitleHome(),
                            ],
                          )
                        : ListItemsSearch(listDataModel: controller.listData))
              ],
            ))));
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listDataModel;
  const ListItemsSearch({super.key, required this.listDataModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listDataModel.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goTOPageProductDetails(listDataModel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imagesItems}/${listDataModel[index].itemsImage}"),
                      ),
                      Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text("${listDataModel[index].itemsName}"),
                          subtitle:
                              Text("${listDataModel[index].categoriesName}"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
