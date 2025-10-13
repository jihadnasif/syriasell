import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:syria_sell/controller/MorePageController/MorePageController.dart';
import 'package:syria_sell/core/constant/AppimageAsset.dart';
import 'package:syria_sell/view/widget/Ads/TitleH1Ads.dart';
import 'package:syria_sell/view/widget/Home/HeaderHomeTitle.dart';
import 'package:syria_sell/view/widget/More/CustomFormMore.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/AppColor.dart';
import '../../../core/functions/goNewAds.dart';
import '../../../core/functions/validInput.dart';
import '../../widget/Auth/CustomButtonAuth.dart';
import '../../widget/Home/BottomTap.dart';

class Mydata extends StatelessWidget {
  const Mydata({super.key});

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
      body: GetBuilder<MorePageControllerImp>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.loading) {
            return Center(
              child: Lottie.asset(ImageAsset.newLoding, fit: BoxFit.contain),
            );
          }
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              padding: EdgeInsets.zero,
              children: [
                HeaderHomeTitle(
                  textTile: "166".tr,
                  iconTrailing: const Icon(Icons.arrow_forward),
                  functionTrailing: () {
                    Get.back();
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 800),
                    child: Form(
                      key: controller.formstate,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.transparent,
                                  child: Image.asset(
                                      "${ImageAsset.KrootImageIcons}/profile.png"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        TitleH1Ads(
                                          textTitleH1: "4".tr,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          controller.listUser.isNotEmpty
                                              ? controller.listUser[0].name ??
                                                  ""
                                              : "",
                                        ),
                                      ],
                                    ),
                                    /*Row(
                                      children: [
                                        TitleH2Ads(
                                          textTitleH2: "7".tr,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          controller.listUser.isNotEmpty
                                              ? controller.listUser[0].email ?? ""
                                              : "",
                                        ),
                                      ],
                                    ),*/
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomFormMore(
                              valid: (val) {
                                return validInput(val!, 2, 50, "username");
                              },
                              titleForm: "167".tr + " " + "4".tr,
                              myController: controller.contName,
                              keyboardtype: TextInputType.name,
                              texthint: "${"3".tr} ${"4".tr}",
                              iconData: Icons.person,
                            ),
                            CustomFormMore(
                              titleForm: "167".tr + " " + "8".tr,
                              myController: controller.contPhon,
                              texthint: "8".tr,
                              iconData: Icons.phone_android,
                            ),

                            /*CustomFormMore(
                              titleForm: "167".tr + " " + "7".tr,
                              myController: controller.contEml,
                              texthint: "7".tr,
                              iconData: Icons.email,
                            ),*/
                            CustomFormMore(
                              valid: (val) {
                                if (val == null || val.isEmpty) {
                                  return null;
                                }
                                return validInput(val, 3, 100, "password");
                              },
                              titleForm: "167".tr + " " + "9".tr,
                              isBeforLast: true,
                              obscureTextStat: controller.isShowPass,
                              ontapIcon: () {
                                controller.isShowPassFun();
                              },
                              myController: controller.contPassword,
                              texthint: "${"3".tr} ${"9".tr}",
                              iconData: Icons.lock_open,
                            ),
                            CustomFormMore(
                              valid: (val) {
                                if (val == null || val.isEmpty) {
                                  return null; // ما في خطأ إذا ما كتب
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
                              titleForm: "11".tr + " " + "9".tr,
                              myController: controller.contConfirmPassword,
                              texthint: "${"12".tr} ${"3".tr} ${"9".tr}",
                              iconData: Icons.lock_open,
                            ),
                            CustomButtonAuth(
                              onpressed: () {
                                controller.editSave();
                              },
                              textButton: "151".tr,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
