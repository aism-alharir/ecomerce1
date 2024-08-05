import 'package:ecomerce1/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class VerFiyCode_Controller extends GetxController {
  cheekCode();
  goToResetPassword();
}

class VerFiyCode_ControllerImp extends VerFiyCode_Controller {
  @override
  goToResetPassword() {
    Get.offNamed(AppRoutes.resetPassword);
    throw UnimplementedError();
  }

  @override
  cheekCode() {
    throw UnimplementedError();
  }


}
