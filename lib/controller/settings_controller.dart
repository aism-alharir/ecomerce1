import 'package:ecomerce1/core/constant/routes.dart';
import 'package:ecomerce1/core/services/services.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }
}
