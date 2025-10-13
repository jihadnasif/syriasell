import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/controller/Auth/ControllerForgetPassword/ControllerResetPassword.dart';
import 'package:syria_sell/core/class/handlingdataview.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/constant/variable.dart';
import 'package:syria_sell/view/widget/Auth/CustomTextBodyAuth.dart';

import '../../../../core/functions/validInput.dart';
import '../../../widget/Auth/CustomButtonAuth.dart';
import '../../../widget/Auth/CustomTextFormAuth2.dart';
import '../../../widget/Auth/CustomTextTitleAth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ControllerResetPasswordImp());
    return Scaffold(
      body: GetBuilder<ControllerResetPasswordImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: ListView(
            padding: EdgeInsets.all(0),
            children: [
              Container(
                height: 112,
                color: Kcolor().kHeader,
              ),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: Form(
                      key: controller.formstate,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: sizeHeight(context) * 0.03,
                              //left: sizedWidth(context) * 0.3,
                            ),
                            child: CustomTextTilteAuth(
                              textTitle: "27".tr,
                            ),
                          ),
                          SizedBox(
                            height: sizeHeight(context) * 0.01,
                          ),
                          CustomTextBodyAuth(textBody: "28".tr),
                          SizedBox(
                            height: sizeHeight(context) * 0.07,
                          ),
                          CustomTextFormAuth(
                            valid: (val) {
                              return validInput(val!, 5, 100, "password");
                            },
                            myController: controller.NewPassword,
                            obscureTextStat: controller.isShowPass,
                            ontapIcon: () {
                              controller.isShowPassFun();
                            },
                            textlabel: '9'.tr,
                            texthint: "${"3".tr} ${"9".tr}",
                            iconData: Icons.lock_open,
                          ),
                          CustomTextFormAuth(
                            valid: (val) {
                              if (val == null || val.isEmpty) {
                                return "Confirm Password is required";
                              }
                              if (val != controller.NewPassword.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                            obscureTextStat: controller.isShowPass,
                            ontapIcon: () {
                              controller.isShowPassFun();
                            },
                            myController: controller.RepetNewPassword,
                            textlabel: "${"11".tr} ${"9".tr}",
                            texthint: "${"12".tr} ${"3".tr} ${"9".tr}",
                            iconData: Icons.lock_open,
                          ),
                          SizedBox(
                            height: sizeHeight(context) * 0.1,
                          ),
                          CustomButtonAuth(
                            onpressed: () {
                              controller.ResetPassword();
                            },
                            textButton: "11".tr,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
