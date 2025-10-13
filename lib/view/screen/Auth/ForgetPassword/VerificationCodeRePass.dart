import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:syria_sell/controller/Auth/ControllerForgetPassword/ControllerVerificationPass.dart';
import 'package:syria_sell/core/class/handlingdataview.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/constant/variable.dart';
import 'package:syria_sell/view/widget/Auth/CustomTextBodyAuth.dart';

import '../../../widget/Auth/CustomTextTitleAth.dart';

class VerificationCodeRePass extends StatelessWidget {
  const VerificationCodeRePass({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ControllerVerificationCodeImp());
    return Scaffold(
      body: GetBuilder<ControllerVerificationCodeImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: ListView(
            padding: EdgeInsets.all(0),
            children: [
              Container(
                height: 112,
                color: Kcolor().kHeader,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: sizeHeight(context) * 0.02,
                    ),
                    CustomTextTilteAuth(textTitle: "15".tr),
                    SizedBox(
                      height: sizeHeight(context) * 0.01,
                    ),
                    CustomTextBodyAuth(textBody: "16".tr + controller.email!),
                    SizedBox(
                      height: sizeHeight(context) * 0.03,
                    ),
                    OtpTextField(
                      numberOfFields: 4,
                      enabledBorderColor: Kcolor().kSecondaryColor,
                      focusedBorderColor: Kcolor().kPrimaryColor,
                      showFieldAsBox: true,
                      fieldWidth: 60,
                      borderRadius: BorderRadius.circular(8),
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) {
                        controller.GoToResetPassword(verificationCode);
                      }, // end onSubmit
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        Text(
                          "209".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          controller.canResend
                              ? "210".tr
                              : "211".tr + "${controller.timerText}",
                          style: TextStyle(
                            color: controller.canResend
                                ? Colors.green
                                : Colors.red,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            controller.reSendVerify();
                          },
                          child: Center(
                            child: InkWell(
                              onTap: controller.canResend
                                  ? () {
                                      controller.reSendVerify();
                                    }
                                  : null,
                              child: Text(
                                "17".tr,
                                style: TextStyle(
                                  color: controller.canResend
                                      ? Kcolor().kPrimaryColor
                                      : Colors.grey, // لون رمادي لو معطل
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
 OtpTextField(
                      numberOfFields: 5,
                      cursorColor: Kcolor().kThirdColor,
                      enabledBorderColor: Kcolor().kSecondaryColor,
                      focusedBorderColor: Kcolor().kPrimaryColor,
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) {
                        controller.GoToResetPassword(verificationCode);
                      }, // end onSubmit
                    ),
 */
