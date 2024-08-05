import 'package:ecomerce1/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordLoginController extends GetxController {
  goToPageLogin();
}

class SuccessResetPasswordLoginControllerImp extends SuccessResetPasswordLoginController {
  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
