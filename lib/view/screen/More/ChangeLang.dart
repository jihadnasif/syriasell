import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/controller/MorePageController/MorePageController.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/constant/variable.dart';
import 'package:syria_sell/view/widget/Ads/TitleH2Ads.dart';
import 'package:syria_sell/view/widget/Home/HeaderHomeTitle.dart';

import '../../../core/functions/goNewAds.dart';
import '../../widget/Auth/CustomButtonAuth.dart';
import '../../widget/Home/BottomTap.dart';
import '../../widget/More/ButtonChangeLang.dart';

class ChangeLang extends StatelessWidget {
  const ChangeLang({super.key});

  @override
  Widget build(BuildContext context) {
    MorePageControllerImp controller = Get.put(MorePageControllerImp());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToNewAds();
        },
        shape: CircleBorder(),
        backgroundColor: Kcolor().kwhite,
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomTap(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          HeaderHomeTitle(
            textTile: "60".tr, // جلب العنوان
            iconTrailing: const Icon(Icons.arrow_forward),
            functionTrailing: () {
              Get.back();
            },
          ),
          const SizedBox(height: 60),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleH2Ads(
                      textTitleH2: "147".tr,
                      sizeFont: 20,
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ButtonChangeLang(
                            text: "148".tr,
                            colorButton: Kcolor().kButtonHome,
                            isSelected: controller.selectedLangIndex.value == 0,
                            onTap: () {
                              controller.changeLang(0);
                            },
                          ),
                          ButtonChangeLang(
                            text: "149".tr,
                            colorButton: Kcolor().kButtonHome,
                            isSelected: controller.selectedLangIndex.value == 1,
                            onTap: () {
                              controller.changeLang(1);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: sizeHeight(context) * 0.25,
                    ),
                    Center(
                      child: Text("150".tr),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    CustomButtonAuth(
                      onpressed: () {
                        controller.savedLang();
                      },
                      textButton: "151".tr,
                    ),
                    SizedBox(
                      height: sizeHeight(context) * 0.25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
