//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/core/functions/hindlingData.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/ArabicToEnglish.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/Auth/signinData.dart';

abstract class ControllerSignIn extends GetxController {
  signIn();

  GoToForgetPassword();
}

class ControllerSignInImp extends ControllerSignIn {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController contPassword;
  String phone = '';
  SignInData signInData = SignInData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  bool isShowPass = true;
  MyServices myServices = Get.find();
  bool isOn = true;

  void toggle() {
    isOn = !isOn;
    update(); // لازم تنادي update لتحديث الواجهة
  }

  isShowPassFun() {
    isShowPass = isShowPass == true ? false : true;
    update();
  }

  signIn() async {
    var formData = formstate.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      // تحديد إن كان إدخال المستخدم بريدًا إلكترونيًا أم رقم هاتف

      phone = convertArabicToEnglishDigits(phone).replaceAll('+', '');

      // إرسال بيانات تسجيل الدخول
      var response = await signInData.loginData(
        phone,
        contPassword.text,
      );

      statusRequest = hindlingData(response);
      print("-----------------$statusRequest----------");
      print("-------****----------$response----***------");

      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          final data = response["data"];

          if (data["approve"] == 1) {
            // تخزين البيانات في SharedPreferences
            myServices.sharedPreferences.setInt("idUser", data["id"]);

            myServices.sharedPreferences.setString("name", data["name"] ?? "");

            /* if (data["email"] != null) {
              myServices.sharedPreferences
                  .setString("email", data["email"].toString());
            }*/

            if (data["phone"] != null) {
              myServices.sharedPreferences
                  .setString("phone", data["phone"].toString());
            }

            if (isOn) {
              await myServices.sharedPreferences.setString("step", "1");
            } else {
              await myServices.sharedPreferences.remove("step"); // لا تذكره
            }
            print("isOn value: $isOn");
            print(
                "Saved step: ${myServices.sharedPreferences.getString("step")}");
            Get.offNamed(AppRoute.rHomeUser);
          }
        }
      } else {
        Get.defaultDialog(
          title: "32".tr,
          middleText: "35".tr,
        );
      }

      update();
    }
  }

  goToSignUp() {
    Get.offNamed(AppRoute.rSignUp);
  }

  @override
  void onInit() {
    contPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    contPassword.dispose();
    super.dispose();
  }

  GoToForgetPassword() {
    Get.offNamed(AppRoute.rCheckEmailGetPass);
  }
}
