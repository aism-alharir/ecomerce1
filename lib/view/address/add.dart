import 'package:ecomerce1/controller/address/AddressAdd_controller.dart';
import 'package:ecomerce1/core/class/handlingdataview.dart';
import 'package:ecomerce1/core/shared/custom_button.dart';
import 'package:ecomerce1/view/widget/auth/custombuttonauth.dart';
import 'package:ecomerce1/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddressAddController controller = Get.put(AddressAddController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Address"),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<AddressAddController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    CustomTextFormAuth(
                        hintText: "city",
                        label: "city",
                        icon: Icons.location_city,
                        myController: controller.city!,
                        valid: (val) {},
                        isNumber: false),
                    CustomTextFormAuth(
                        hintText: "street",
                        label: "street",
                        icon: Icons.streetview,
                        myController: controller.street!,
                        valid: (val) {},
                        isNumber: false),
                    CustomTextFormAuth(
                        hintText: "name",
                        label: "name",
                        icon: Icons.near_me,
                        myController: controller.name!,
                        valid: (val) {},
                        isNumber: false),
                    CustomButton(
                        text: "add",
                        onPressed: () {
                          controller.addAddress();
                        })
                  ],
                )),
          )),
    );
  }
}
