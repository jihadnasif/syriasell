import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/controller/Auth/ControllerSignIn.dart';
import 'package:syria_sell/core/class/handlingdataview.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/constant/variable.dart';
import 'package:syria_sell/core/functions/validInput.dart';
import 'package:syria_sell/view/widget/Auth/CustomButtonAuth.dart';
import 'package:syria_sell/view/widget/Auth/CustomTextFormAuth2.dart';
import 'package:syria_sell/view/widget/Auth/CustomTextTitleAth.dart';

import '../../widget/Job/CustomPhoneInput.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ControllerSignInImp());
    return Scaffold(
      body: GetBuilder<ControllerSignInImp>(builder: (controller) {
        return HandlingDataRequest(
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
                              textTitle: "6".tr,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      controller.toggle();
                                    },
                                    icon: Icon(
                                      controller.isOn
                                          ? Icons.toggle_on
                                          : Icons.toggle_off,
                                      color: controller.isOn
                                          ? Kcolor().kPrimaryColor
                                          : Kcolor().kblack,
                                      size: 40,
                                    ),
                                  ),
                                  Text(
                                    "21".tr,
                                    style: TextStyle(
                                        color: Kcolor().kPrimaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  controller.GoToForgetPassword();
                                },
                                child: Text(
                                  "20".tr,
                                  style: TextStyle(
                                      color: Kcolor().kPrimaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: sizeHeight(context) * 0.07,
                          ),
                          CustomButtonAuth(
                            onpressed: () {
                              controller.signIn();
                            },
                            textButton: "3".tr,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          CustomButtonAuth(
                            onpressed: () {
                              controller.goToSignUp();
                            },
                            textButton: "14".tr,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
                  SizedBox(
                    height: 70,
                  ),
                  CustomRowAuth(
                    textQuestion: "22".tr,
                    ontap: () {
                      controller.GoToSignUp();
                    },
                    textOnTap: "23".tr,
                  ),
                ],
              ),*/
              SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      }),
    );
  }
}
