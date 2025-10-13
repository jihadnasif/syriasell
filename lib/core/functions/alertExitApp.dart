import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> AlertExitApp() {
  Get.defaultDialog(
    title: "153".tr,
    middleText: "161".tr,
    actions: [
      ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: Text("11".tr),
      ),
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("162".tr),
      ),
    ],
  );
  return Future.value(true);
}
