import 'package:ecomerce1/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class VerFiyCodeSignUp_Controller extends GetxController {
  cheekCode();
  goToSuccessSignUp();
}

class VerFiyCodeSignUp_ControllerImp extends VerFiyCodeSignUp_Controller {
  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoutes.successSignUp);
  }

  @override
  cheekCode() {}
}
