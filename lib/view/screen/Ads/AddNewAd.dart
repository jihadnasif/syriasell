import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/controller/Ads/AddFullAdController.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/functions/validInput.dart';
import 'package:syria_sell/core/shared/CustomDropDownList.dart';
import 'package:syria_sell/view/widget/Ads/AddimgAds.dart';
import 'package:syria_sell/view/widget/Ads/BoxTitleDescription.dart';
import 'package:syria_sell/view/widget/Ads/Formfilde.dart';
import 'package:syria_sell/view/widget/Ads/TitleH1Ads.dart';
import 'package:syria_sell/view/widget/Ads/TitleH2Ads.dart';
import 'package:syria_sell/view/widget/Home/HeaderHomeTitle.dart';

import '../../../controller/car/SelectedCarController.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/DialogAdds.dart';
import '../../widget/Auth/CustomButtonAuth.dart';
import '../../widget/Home/BottomTap.dart';
import '../../widget/car/SelectedCar.dart';

class AddNewAd extends StatelessWidget {
  const AddNewAd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAdFullControllerImp());
    Get.put(SelectedCarController());

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
            padding: EdgeInsets.zero,
            children: [
              HeaderHomeTitle(
                textTile: "82".tr,
                iconTrailing: Icon(Icons.arrow_forward),
                functionTrailing: () {
                  Get.back();
                },
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TitleH1Ads(textTitleH1: "83".tr),
              ),
              SizedBox(height: 20),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: controller.formStep1Key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleH2Ads(textTitleH2: "84".tr),
                          SizedBox(height: 10),
                          // ويدجت الصور المحدثة
                          AddimgAds(),
                          SizedBox(height: 20),
                          TitleH2Ads(textTitleH2: "90".tr),
                          SizedBox(height: 10),
                          CustomFormField(
                            myController: controller.contAdsName,
                            texthint: "164".tr,
                            valid: (val) => validInput(val!, 2, 30, ""),
                          ),
                          SizedBox(height: 20),
                          TitleH2Ads(textTitleH2: "81".tr),
                          SizedBox(height: 10),
                          CustomDropDownList(
                            valid: (val) => validInput(val!, 1, 100, ""),
                            title: "101".tr,
                            listData: controller.listSelectedCategory,
                            dropName: controller.categName,
                            dropId: controller.categId,
                          ),
                          //-------if selected car--------

                          if (int.tryParse(controller.categId.text) == 1)
                            SelectedCar(),
                          //-------end selected car--------

                          SizedBox(height: 20),
                          TitleH2Ads(textTitleH2: "100".tr),
                          SizedBox(height: 10),
                          BoxTitleDescription(
                            myController: controller.contAdsDesc,
                            texthint: "102".tr,
                            valid: (val) => validInput(val!, 3, 500, ""),
                          ),
                          SizedBox(height: 20),
                          TitleH2Ads(textTitleH2: "130".tr),
                          SizedBox(height: 10),
                          CustomDropDownList(
                            valid: (val) => validInput(val!, 1, 100, ""),
                            title: "130".tr,
                            listData: controller.listSelectedStatus,
                            dropName: controller.statusName,
                            dropId: controller.statusId,
                          ),
                          SizedBox(height: 20),
                          TitleH2Ads(textTitleH2: "103".tr),
                          SizedBox(height: 10),

                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: CustomDropDownList(
                                  valid: (val) => validInput(val!, 1, 100, ""),
                                  title: "175".tr,
                                  listData: controller.listSelectedCurrency,
                                  dropName: controller.currencyName,
                                  dropId: controller.currencyId,
                                ),
                              ),
                              Expanded(
                                child: CustomFormField(
                                  myController: controller.contAdsPrice,
                                  texthint: "1000",
                                  valid: (val) => validInput(val!, 1, 30, ""),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 20),
                          TitleH1Ads(textTitleH1: "105".tr),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(top: 6, right: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...List.generate(
                                  controller.listUserModel.length,
                                  (index) => Text(
                                    "${controller.listUserModel[index].phone}",
                                    style:
                                        TextStyle(color: Kcolor().kTitleText),
                                  ),
                                ),
                                /*
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    RowAdsIconText(
                                      text: "107".tr,
                                      onPress: () => controller.toggleMobile(),
                                      icon: Icon(
                                        controller.isOnMobile
                                            ? Icons.toggle_on
                                            : Icons.toggle_off,
                                        color: controller.isOnMobile
                                            ? Kcolor().kPrimaryColor
                                            : Kcolor().kblack,
                                        size: 50,
                                      ),
                                    ),
                                    RowAdsIconText(
                                      text: "108".tr,
                                      onPress: () => controller.toggleWhatsApp(),
                                      icon: Icon(
                                        controller.isOnWhatsApp
                                            ? Icons.toggle_on
                                            : Icons.toggle_off,
                                        color: controller.isOnWhatsApp
                                            ? Kcolor().kPrimaryColor
                                            : Kcolor().kblack,
                                        size: 50,
                                      ),
                                    ),
                                  ],
                                ),
                              */
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                          CustomButtonAuth(
                            textButton: "109".tr,
                            onpressed: () {
                              controller.addAndContinue();
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
