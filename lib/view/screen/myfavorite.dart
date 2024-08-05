import 'package:ecomerce1/controller/myfavorite_controller.dart';
import 'package:ecomerce1/core/class/handlingdataview.dart';
import 'package:ecomerce1/view/widget/myfavorite/customlistfavorieitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<MyFavoriteController>(
            builder: (controller) => ListView(
              children: [
                // CustomAppBar(
                //   titleappbar: "49".tr,
                //   onPressedSearch: () {},
                //   onPressedIconFavorite: () {},
                // ),
                const SizedBox(
                  height: 20,
                ),
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (context, index) {
                        return CustomListFavoriteItems(
                            itemsModel: controller.data[index]);
                      },
                    ))
              ],
            ),
          )),
    );
  }
}
