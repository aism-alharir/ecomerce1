import 'package:ecomerce1/controller/home_controller.dart';
import 'package:ecomerce1/core/constant/color.dart';
import 'package:ecomerce1/core/functions/translatedatabase.dart';
import 'package:ecomerce1/data/model/categoriesmodel.dart';
import 'package:ecomerce1/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomListCategoriesHome extends GetView<HomeControllerImp> {
  const CustomListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Categories(
              i: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index])),
          separatorBuilder: (context, index) => const SizedBox(
                width: 17,
              ),
          itemCount: controller.categories.length),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i!, categoriesModel.categoriesId.toString());
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 70,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.thirdColor),
            child: SvgPicture.network(width: 90,height: 60,
              "${AppLink.imagesCategories}/${categoriesModel.categoriesImage}",
              color: AppColor.primaryColor,
            ),
          ),
          Text(
            "${translateDataBase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)},",
            style: const TextStyle(color: AppColor.black, fontSize: 14),
          )
        ],
      ),
    );
  }
}
