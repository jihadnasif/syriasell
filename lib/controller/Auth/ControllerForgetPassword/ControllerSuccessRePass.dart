import 'package:get/get.dart';

import '../../../core/constant/routes.dart';

abstract class ControllerSuccessRePass extends GetxController {
  GoToSignIn();
}

class ControllerSuccessRePassImp extends ControllerSuccessRePass {
  @override
  GoToSignIn() {
    Get.offAndToNamed(AppRoute.rSignIn);
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
