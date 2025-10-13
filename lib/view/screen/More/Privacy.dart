import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:syria_sell/controller/MorePageController/MorePageController.dart';
import 'package:syria_sell/core/constant/variable.dart';
import 'package:syria_sell/core/functions/translateDataBase.dart';
import 'package:syria_sell/view/widget/Home/HeaderHomeTitle.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/AppColor.dart';
import '../../../core/constant/AppimageAsset.dart';
import '../../../core/functions/goNewAds.dart';
import '../../widget/Beginning/LogoOnly.dart';
import '../../widget/Home/BottomTap.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});
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
            widget: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: controller.listPrivacy.length, // عدد العناصر
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    HeaderHomeTitle(
                      textTile: translateDataBase(
                          controller.listPrivacy[index].titleEn,
                          controller.listPrivacy[index].titleAr), // جلب العنوان
                      iconTrailing: const Icon(Icons.arrow_forward),
                      functionTrailing: () {
                        Get.back();
                      },
                    ),
                    const SizedBox(height: 20),
                    LogoOnly(
                      radiuSize: sizeHeight(context) * 0.1,
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 800),
                        child: SizedBox(
                          width: sizedWidth(context) * 0.7,
                          child: TextFormField(
                            initialValue: translateDataBase(
                                    controller.listPrivacy[index].contentEn,
                                    controller.listPrivacy[index].contentAr) ??
                                "",
                            maxLines: null,
                            readOnly: true, // قراءة فقط
                            decoration: InputDecoration(
                              //labelText: "وصف الإعلان",
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 2,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 20, // المسافة عمودياً
                                horizontal: 12, // المسافة أفقياً
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
