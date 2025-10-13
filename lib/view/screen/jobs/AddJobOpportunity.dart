import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/functions/validInput.dart';
import 'package:syria_sell/view/widget/Ads/BoxTitleDescription.dart';
import 'package:syria_sell/view/widget/Ads/Formfilde.dart';
import 'package:syria_sell/view/widget/Ads/TitleH2Ads.dart';
import 'package:syria_sell/view/widget/Auth/CustomButtonAuth.dart';
import 'package:syria_sell/view/widget/Job/addImageJob.dart';
import 'package:syria_sell/view/widget/Job/headerWithLogo.dart';

import '../../../controller/Jobs/AddJobOppController.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/DialogAdds.dart';
import '../../../core/shared/CustomDropDownList.dart';
import '../../widget/Home/BottomTap.dart';
import '../../widget/Job/CustomPhoneInput.dart';
import '../../widget/Job/titleH2Icon.dart';

class AddJobOpportunity extends StatelessWidget {
  const AddJobOpportunity({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(JobAddOppController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showInfoDialogAdds();
        },
        shape: CircleBorder(),
        backgroundColor: Kcolor().kwhite,
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomTap(),
      body: GetBuilder<JobAddOppController>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: ListView(
            padding: EdgeInsets.zero,
            children: [
              HeaderWithLogo(
                textTile: "183".tr,
              ),
              SizedBox(height: 30),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              TitleH2Ads(textTitleH2: "84".tr),
                              Text("184".tr),
                            ],
                          ),
                          SizedBox(height: 10),
                          AddimgJob(),
                          SizedBox(height: 20),
                          TitleH2JobIcon(
                            textTitleH2: "185".tr,
                            emoji: "🏪",
                          ),
                          SizedBox(height: 10),
                          CustomFormField(
                            myController: controller.companyName,
                            texthint: "185".tr,
                            valid: (val) => validInput(val!, 1, 30, ""),
                          ),
                          SizedBox(height: 20),
                          TitleH2JobIcon(
                            textTitleH2: "186".tr,
                            emoji: "📝",
                          ),
                          SizedBox(height: 10),
                          CustomFormField(
                            myController: controller.specialization,
                            texthint: "186".tr,
                            valid: (val) => validInput(val!, 1, 30, ""),
                          ),
                          SizedBox(height: 20),
                          TitleH2JobIcon(
                            textTitleH2: "188".tr,
                            emoji: "📍",
                          ),
                          SizedBox(height: 10),
                          CustomDropDownList(
                            title: "128".tr,
                            listData: controller.listSelectedCity,
                            dropName: controller.cityName,
                            dropId: controller.cityId,
                            valid: (val) => validInput(val!, 1, 30, ""),
                          ),
                          SizedBox(height: 20),
                          TitleH2JobIcon(
                            textTitleH2: "187".tr,
                            emoji: "✍",
                          ),
                          SizedBox(height: 10),
                          BoxTitleDescription(
                            myController: controller.workDescription,
                            texthint: "187".tr,
                            valid: (val) => validInput(val!, 3, 500, ""),
                          ),
                          SizedBox(height: 20),
                          TitleH2JobIcon(
                            textTitleH2: "8".tr,
                            emoji: "📞",
                          ),
                          SizedBox(height: 10),
                          PhoneInputWidget(
                            onChanged: (fullNumber) {
                              controller.phoneNumber = fullNumber;
                              debugPrint(
                                  "📱 الرقم النهائي: $controller.phoneNumber");
                            },
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              TitleH2JobIcon(
                                textTitleH2: "7".tr,
                                emoji: "📧",
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("184".tr),
                            ],
                          ),
                          SizedBox(height: 10),
                          CustomFormField(
                            myController: controller.email,
                            texthint: "7".tr,
                            valid: (val) {
                              if (val == null || val.isEmpty) {
                                return null; // مسموح يتركه فاضي
                              }
                              return validInput(val, 3, 30,
                                  "email"); // إذا كتب لازم يكون صحيح
                            },
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          CustomButtonAuth(
                            textButton: "113".tr,
                            onpressed: () {
                              controller.addOpportunity();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
