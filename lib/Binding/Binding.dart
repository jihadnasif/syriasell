import 'package:get/get.dart';

import '../core/class/CRUD.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CRUD());
  }
}
