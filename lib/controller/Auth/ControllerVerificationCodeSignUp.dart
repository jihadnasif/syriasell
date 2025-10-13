import 'dart:async';

import 'package:get/get.dart';

import '../../../core/constant/routes.dart';
import '../../core/class/StatusRequest.dart';
import '../../core/functions/hindlingData.dart';
import '../../data/datasource/remote/Auth/ForGetPass/VerifiCodePassData.dart';
import '../../data/datasource/remote/Auth/verificodeSignupData.dart';

abstract class ControllerVerificationCodeSignUp extends GetxController {
  GoToSuccessSignUp(String verificationCode);
  reSendVerify();
}

class ControllerVerificationCodeSignUpImp
    extends ControllerVerificationCodeSignUp {
  VerificodeSignupData verificodeSignupData = VerificodeSignupData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late String? email;
  late String? phone;
  @override
  GoToSuccessSignUp(verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await verificodeSignupData.postData(
      email ?? "",
      phone ?? "",
      verificationCode,
    );

    print("Raw response: $response");

    statusRequest = hindlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoute.rSuccessSignUpAuth);
      }
    } else {
      // الاتصال فشل أو خطأ في الخادم
      Get.defaultDialog(
        title: "32".tr,
        middleText: response["message"] ?? "31".tr,
      );
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  VerifiCodePassData verifiCodePassData = VerifiCodePassData(Get.find());

  @override
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
    email = Get.arguments["email"];
    phone = Get.arguments["phone"];
    print("----------$email");
    print("----------$phone");
    //email = "jihad@gmail.com";
    startTimer();
    super.onInit();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
