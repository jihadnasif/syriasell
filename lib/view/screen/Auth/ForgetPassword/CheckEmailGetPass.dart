import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/core/class/handlingdataview.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/constant/variable.dart';
import 'package:syria_sell/core/functions/validInput.dart';
import 'package:syria_sell/view/widget/Auth/CustomButtonAuth.dart';
import 'package:syria_sell/view/widget/Auth/CustomRowAuth.dart';
import 'package:syria_sell/view/widget/Auth/CustomTextFormAuth.dart';

import '../../../../controller/Auth/ControllerForgetPassword/ControllerCheckEmailGetPass.dart';
import '../../../widget/Auth/CustomTextBodyAuth.dart';
import '../../../widget/Auth/CustomTextTitleAth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ControllerCheckEmailImp());
    return Scaffold(
      body: GetBuilder<ControllerCheckEmailImp>(
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
                              //left: sizedWidth(context) * 0.25,
                            ),
                            child: CustomTextTilteAuth(
                              textTitle: "25".tr,
                            ),
                          ),
                          SizedBox(
                            height: sizeHeight(context) * 0.01,
                          ),
                          CustomTextBodyAuth(textBody: "24".tr),
                          SizedBox(
                            height: sizeHeight(context) * 0.07,
                          ),
                          Text("202".tr),
                          SizedBox(
                            height: 5,
                          ),
                          CustomFormField(
                            valid: (val) {
                              return validInput(val!, 3, 30, "");
                            },
                            myController: controller.contEmlPhon,
                            textlabel: "${"7".tr} ${"10".tr} ${"8".tr}",
                            texthint:
                                "${"3".tr} ${"7".tr} ${"10".tr} ${"8".tr}",
                            prefixIcon: Icon(Icons.phone),
                          ),
                          SizedBox(
                            height: sizeHeight(context) * 0.1,
                          ),
                          CustomButtonAuth(
                            onpressed: () {
                              controller.checkEmail();
                            },
                            textButton: "26".tr,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: sizeHeight(context) * 0.08,
              ),
              CustomRowAuth(
                textQuestion: "14".tr,
                textOnTap: "1".tr,
                ontap: () {
                  controller.goToSignUp();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
