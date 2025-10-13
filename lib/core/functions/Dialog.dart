import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../constant/variable.dart';

void showInfoDialog(
  String title,
  String desc, {
  DialogType dialogType = DialogType.info, // 🔹 نوع الدايالوغ اختياري
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
      tablet: sizedWidth(Get.context!) * 0.5,
      desktop: sizedWidth(Get.context!) * 0.4,
    ),
    context: Get.context!,
    dialogType: dialogType,
    animType: AnimType.scale,
    title: title,
    desc: desc,
    btnOkText: okButtonText,
    btnOkOnPress: onOkPress,
    btnCancelText: cancelButtonText,
    btnCancelOnPress: onCancelPress,
    autoHide: autoHid,
  ).show();
}
