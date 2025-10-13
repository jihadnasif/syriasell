import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/controller/Ads/AddFullAdController.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/functions/validInput.dart';
import 'package:syria_sell/core/shared/CustomDropDownList.dart';
import 'package:syria_sell/view/widget/Ads/Formfilde.dart';
import 'package:syria_sell/view/widget/Ads/TitleH1Ads.dart';
import 'package:syria_sell/view/widget/Ads/TitleH2Ads.dart';
import 'package:syria_sell/view/widget/Auth/CustomButtonAuth.dart';
import 'package:syria_sell/view/widget/Home/HeaderHomeTitle.dart';

import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/DialogAdds.dart';
import '../../widget/Home/BottomTap.dart';

class AddAd extends StatelessWidget {
  const AddAd({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AddAdFullControllerImp());

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
      body: GetBuilder<AddAdFullControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: ListView(
            padding: EdgeInsets.all(0),
            children: [
              HeaderHomeTitle(
                textTile: "82".tr,
                iconTrailing: Icon(Icons.arrow_forward),
                functionTrailing: () {
                  Get.back();
                },
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TitleH1Ads(
                  textTitleH1: "110".tr,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: controller.formStep2Key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomDropDownList(
                            valid: (val) => validInput(val!, 1, 100, ""),
                            title: "128".tr,
                            listData: controller.listSelectedCity,
                            dropName: controller.cityName,
                            dropId: controller.cityId,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TitleH2Ads(
                            textTitleH2: "129".tr,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomFormField(
                            myController: controller.contAdsArea,
                            texthint: "3".tr + " " + "129".tr,
                            valid: (val) {
                              return validInput(val!, 1, 100, "");
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          /*
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleH1Ads(
                                  textTitleH1: "112".tr,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RowAdsIconText(
                                  text: "111".tr,
                                  isTextWrap: true,
                                  onPress: () {
                                    controller.toggleOptiBuy();
                                  },
                                  icon: Icon(
                                    controller.isOnOptiBuy
                                        ? Icons.toggle_on
                                        : Icons.toggle_off,
                                    color: controller.isOnOptiBuy
                                        ? Kcolor().kPrimaryColor
                                        : Kcolor().kblack,
                                    size: 50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          */
                          SizedBox(
                            height: 40,
                          ),
                          CustomButtonAuth(
                            onpressed: () {
                              controller.addAd();
                            },
                            textButton: "113".tr,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
