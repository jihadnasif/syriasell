import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/core/constant/routes.dart';

import '../services/services.dart';

class MiddPageBeginnig extends GetMiddleware {
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "1") {
      return RouteSettings(name: AppRoute.rHomeUser);
    }
    return null;
    /* if (myServices.sharedPreferences.getString("signin") == "2") {
      return RouteSettings(name: AppRoute.rHomeScreenCreditor);
    }*/
  }
}
