import 'package:ecomerce1/controller/address/address_view_controller.dart';
import 'package:ecomerce1/core/class/handlingdataview.dart';
import 'package:ecomerce1/core/constant/routes.dart';
import 'package:ecomerce1/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("view address"),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(AppRoutes.addressAdd);
            },
            child: const Icon(Icons.add)),
        body: GetBuilder<AddressViewController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => CardAddress(
                  addressModel: controller.data[index],
                  onDelete: () {
                    controller.deleteAddress(controller.data[index].addressId.toString());
                  },
                ),
              ),
            ),
          ),
        ));
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const CardAddress(
      {super.key, required this.addressModel, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: Text(addressModel.addressName!),
          subtitle: Text(
              "${addressModel.addressCity!} ${addressModel.addressStreet!}"),
          trailing: IconButton(
              onPressed: onDelete, icon: const Icon(Icons.delete_outline)),
        ),
      ),
    );
  }
}
