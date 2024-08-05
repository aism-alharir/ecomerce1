import 'package:ecomerce1/controller/settings_controller.dart';
import 'package:ecomerce1/core/constant/color.dart';
import 'package:ecomerce1/core/constant/imageasset.dart';
import 'package:ecomerce1/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      child: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                color: AppColor.primaryColor,
                height: Get.width / 2,
              ),
              Positioned(
                  top: Get.width / 2.4,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: const AssetImage(AppImageAsset.avatar),
                      backgroundColor: Colors.grey[100],
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () {},
                    title: const Text("Disable Notifications"),
                    trailing: Switch(value: true, onChanged: (val) {}),
                  ),
                  //Divider(),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoutes.orderspending);
                    },
                    title: const Text("Orders"),
                    trailing: const Icon(Icons.card_travel),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoutes.ordersarchive);
                    },
                    title: const Text("Archive"),
                    trailing: const Icon(Icons.card_travel),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoutes.addressView);
                    },
                    title: const Text("Address"),
                    trailing: const Icon(Icons.location_on_outlined),
                  ),
                  // Divider(),
                  ListTile(
                    onTap: () {},
                    title: const Text("About us"),
                    trailing: const Icon(Icons.help_outline_rounded),
                  ),
                  //Divider(),
                  ListTile(
                    onTap: () async{
                     await launchUrl(Uri.parse("sms:0982205675"));
                    },
                    title: const Text("contact us"),
                    trailing: const Icon(Icons.phone_callback_outlined),
                  ),
                  //Divider(),
                  ListTile(
                    onTap: () {
                      controller.logout();
                    },
                    title: const Text("Logout"),
                    trailing: const Icon(Icons.exit_to_app),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
