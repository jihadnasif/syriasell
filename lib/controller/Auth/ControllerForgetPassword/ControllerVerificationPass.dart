import 'dart:async';

import 'package:get/get.dart';
import 'package:syria_sell/core/class/StatusRequest.dart';
import 'package:syria_sell/core/constant/routes.dart';
import 'package:syria_sell/core/functions/hindlingData.dart';
import 'package:syria_sell/data/datasource/remote/Auth/ForGetPass/VerifiCodePassData.dart';

abstract class ControllerVerificationCode extends GetxController {
  GoToResetPassword(String verificationCode);
}

class ControllerVerificationCodeImp extends ControllerVerificationCode {
  String? email = '';
  late String? phone;
  StatusRequest statusRequest = StatusRequest.none;
  VerifiCodePassData verifiCodePassData = VerifiCodePassData(Get.find());

  @override
  GoToResetPassword(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await verifiCodePassData.postData(
        email ?? '', phone ?? '', verificationCode);
    statusRequest = hindlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.toNamed(AppRoute.rResetPassword, arguments: {
          "email": email,
          "phone": phone,
        });
      }
    } else {
      Get.defaultDialog(
        title: "32".tr,
        middleText: "36".tr,
      );
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  reSendVerify() {
    if (!canResend) return;

    // هنا الكود اللي يرسل الطلب من جديد
    print("🔄 تم إرسال الكود من جديد");

    // أعد تشغيل المؤقت بعد الضغط
    startTimer();
    verifiCodePassData.reSendVerifyCodeData(phone!);
  }

  bool canResend = false; // 🚫 أول ما يفتح ممنوع
  int remainingSeconds = 180; // 3 دقائق = 180 ثانية
  Timer? _timer;
  void startTimer() {
    _timer?.cancel();
    remainingSeconds = 180;
    canResend = false;
    update();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remainingSeconds--;
      if (remainingSeconds <= 0) {
        canResend = true;
        timer.cancel();
      }
      update();
    });
  }

  String get timerText {
    int minutes = remainingSeconds ~/ 60;
    int seconds = remainingSeconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  void onInit() {
    super.onInit();
    //email = Get.arguments["email"];
    phone = Get.arguments["phone"];
    //email = "en@gm.com";
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
