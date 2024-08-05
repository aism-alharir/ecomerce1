import 'package:ecomerce1/core/class/statusrequest.dart';
import 'package:ecomerce1/core/constant/routes.dart';
import 'package:ecomerce1/core/functions/handlingdatacontroller.dart';
import 'package:ecomerce1/core/services/services.dart';
import 'package:ecomerce1/data/datasource/remote/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUP();
  goToForegetPassword();
}

class LoginCotrollerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  bool isShoowpass = true;
  shoowPassword() {
    isShoowpass = isShoowpass == true ? false : true;
    update();
  }

  @override
  goToSignUP() {
    Get.offNamed(AppRoutes.singUp);
  }

  @override
  login() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // Get.offNamed(AppRoutes.homePage);
          myServices.sharedPreferences
              .setString("id", response['data']['users_id'].toString());
          myServices.sharedPreferences
              .setString("username", response['data']['users_name']);
          myServices.sharedPreferences
              .setString("email", response['data']['users_email']);
          myServices.sharedPreferences
              .setString("phone", response['data']['users_phone']);
          myServices.sharedPreferences.setString('step', "2");
          Get.offNamed(AppRoutes.homePage);
        } else {
          Get.defaultDialog(title: "44".tr, middleText: "45".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print(value);
    //   String? token = value;
    // });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForegetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }
}
