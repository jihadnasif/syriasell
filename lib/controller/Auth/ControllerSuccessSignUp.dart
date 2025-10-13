import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class ControllerSuccessSignUp extends GetxController {
  GoToSignIn();
}

class ControllerSuccessSignUpImp extends ControllerSuccessSignUp {
  @override
  GoToSignIn() {
    Get.offNamed(AppRoute.rSignIn);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
