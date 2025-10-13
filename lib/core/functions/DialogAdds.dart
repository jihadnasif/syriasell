import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../constant/routes.dart';
import '../constant/variable.dart';

void showInfoDialogAdds({
  DialogType dialogType = DialogType.noHeader, // 🔹 نوع الدايالوغ اختياري
  String? okButtonText, // 🔹 نص زر OK (اختياري)
  void Function()? onOkPress, // 🔹 فعل زر OK (اختياري)
  String? cancelButtonText, // 🔹 نص زر Cancel (اختياري)
  void Function()? onCancelPress, // 🔹 فعل زر Cancel (اختياري)
  String? neutralText,
  void Function()? onNeutralPress,
  Duration? autoHid,
}) {
  AwesomeDialog(
    width: getValueForScreenType<double>(
      context: Get.context!,
      mobile: sizedWidth(Get.context!) * 1,
      tablet: sizedWidth(Get.context!) * 0.7,
      desktop: sizedWidth(Get.context!) * 0.5,
    ),
    context: Get.context!,
    dialogType: dialogType,
    animType: AnimType.scale,
    btnOkText: okButtonText,
    btnOkOnPress: onOkPress,
    btnCancelText: cancelButtonText,
    btnCancelOnPress: onCancelPress,
    autoHide: autoHid,
    body: Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Get.offAllNamed(AppRoute.rAddNewAd);
          },
          child: Text(
            "82".tr,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Get.offAllNamed(AppRoute.rAddJobOpportunity);
          },
          child: Text(
            "183".tr,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Get.offAllNamed(AppRoute.rAddJobApplication);
          },
          child: Text(
            "195".tr,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  ).show();
}
