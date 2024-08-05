import 'package:ecomerce1/controller/productdetails_controller.dart';
import 'package:ecomerce1/core/class/handlingdataview.dart';
import 'package:ecomerce1/core/constant/color.dart';
import 'package:ecomerce1/core/constant/routes.dart';
import 'package:ecomerce1/view/widget/productdetails/custompriceand%20count.dart';
import 'package:ecomerce1/view/widget/productdetails/customtoppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/productdetails/customsubitemslist.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
          height: 40,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.primaryColor),
          child: MaterialButton(
              onPressed: () {
                controller.cartController.refreshPage();
                Get.toNamed(AppRoutes.cart);
              },
              child: const Text(
                "Go To Cart",
                style: TextStyle(fontSize: 15, color: Colors.white),
              )),
        ),
        body: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                const CustomTopPageProductDetails(),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.itemsModel.itemsName}",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: AppColor.fourthColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomPriceAndcount(
                          onAdd: () {
                            controller.add();
                          },
                          onRemove: () {
                            controller.remove();
                          },
                          count: "${controller.countItems}",
                          price: "${controller.itemsModel.itemsPriceDiscount}"),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc}",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Color",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: AppColor.fourthColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomSubItemsList(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
