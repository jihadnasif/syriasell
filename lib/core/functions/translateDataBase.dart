import 'package:get/get.dart';

import '../services/services.dart';

translateDataBase(columnEn, columnAr) {
  MyServices myServices = Get.put(MyServices());
  if (myServices.sharedPreferences.getString("lan") == "en") {
    return columnEn;
  } else {
    return columnAr;
  }
}
