import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/controller/Auth/ControllerSignUp.dart';
import 'package:syria_sell/core/class/handlingdataview.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/functions/validInput.dart';
import 'package:syria_sell/view/widget/Auth/CustomButtonAuth.dart';
import 'package:syria_sell/view/widget/Auth/CustomRowAuth.dart';
import 'package:syria_sell/view/widget/Auth/CustomTextBodyAuth.dart';
import 'package:syria_sell/view/widget/Auth/CustomTextFormAuth2.dart';
import 'package:syria_sell/view/widget/Auth/CustomTextTitleAth.dart';

import '../../../core/constant/variable.dart';
import '../../widget/Job/CustomPhoneInput.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ControllerSignUpImp());
    return Scaffold(
      body: GetBuilder<ControllerSignUpImp>(
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
                              top: sizeHeight(context) * 0.02,
                              //left: sizedWidth(context) * 0.4,
                            ),
                            child: CustomTextTilteAuth(
                              textTitle: "1".tr,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          CustomTextFormAuth(
                            valid: (val) {
                              return validInput(val!, 1, 50, "");
                            },
                            myController: controller.contName,
                            keyboardtype: TextInputType.name,
                            textlabel: "4".tr,
                            texthint: "${"3".tr} ${"4".tr}",
                            iconData: Icons.person,
                          ),
                          Text(
                            "208".tr,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          PhoneInputWidget /*Auth*/ (
                            onChanged: (fullNumber) {
                              controller.phone = fullNumber;
                              debugPrint("📱 الرقم النهائي: $controller.phone");
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          CustomTextFormAuth(
                            valid: (val) {
                              return validInput(val!, 3, 100, "password");
                            },
                            obscureTextStat: controller.isShowPass,
                            ontapIcon: () {
                              controller.isShowPassFun();
                            },
                            myController: controller.contPassword,
                            textlabel: "9".tr,
                            texthint: "${"3".tr} ${"9".tr}",
                            iconData: Icons.lock_open,
                          ),
                          CustomTextFormAuth(
                            valid: (val) {
                              if (val == null || val.isEmpty) {
                                return "Confirm Password is required";
                              }
                              if (val != controller.contPassword.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                            obscureTextStat: controller.isShowPass,
                            ontapIcon: () {
                              controller.isShowPassFun();
                            },
                            myController: controller.contConfirmPassword,
                            textlabel: "${"11".tr} ${"9".tr}",
                            texthint: "${"12".tr} ${"3".tr} ${"9".tr}",
                            iconData: Icons.lock_open,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          CustomTextBodyAuth(
                            textBody: "2".tr,
                          ),
                          CustomButtonAuth(
                            onpressed: () {
                              controller.SignUp();
                            },
                            textButton: "14".tr,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 30,
              ),
              //------- google
              /*Column(
                children: [
                  Text(
                    "10".tr,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    radius: 25,
                    child: Image.asset(
                        "${ImageAsset.KrootImageIcons}/google1.png"),
                  ),
                ],
              ),*/
              SizedBox(
                height: 20,
              ),
              CustomRowAuth(
                textQuestion: "5".tr,
                ontap: () {
                  controller.GoToSignIn();
                },
                textOnTap: "6".tr,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
