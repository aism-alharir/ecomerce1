import 'package:ecomerce1/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;
  @override
  goToSuccessResetPassword() {
    Get.offNamed(AppRoutes.successResetPassword);
    throw UnimplementedError();
  }

  @override
  resetPassword() {
    throw UnimplementedError();
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
