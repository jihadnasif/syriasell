import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:syria_sell/core/class/handlingdataview.dart';
import 'package:syria_sell/view/widget/Home/HeaderHomeTitle.dart';
import 'package:syria_sell/view/widget/More/CardMore.dart';

import '../../../controller/MorePageController/MorePageController.dart';
import '../../../core/class/StatusRequest.dart';
import '../../../core/constant/AppColor.dart';
import '../../../core/constant/AppimageAsset.dart';
import '../../../core/functions/goNewAds.dart';
import '../../widget/Home/BottomTap.dart';

class More extends StatelessWidget {
  const More({super.key});

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
      bottomNavigationBar: BottomTap(
        coloIcone4: Kcolor().KlightBlueAccent,
      ),
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
              padding: EdgeInsets.all(0),
              children: [
                HeaderHomeTitle(
                  textTile: "52".tr,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 800),
                    child: Column(
                      children: [
                        ...List.generate(
                          controller.listCardMore.length,
                          (index) {
                            return CardMore(
                              onTap: () {
                                final func =
                                    controller.listCardMore[index]["func"];
                                if (func != null) func();
                              },
                              iconData: controller.listCardMore[index]["icon"],
                              text: controller.listCardMore[index]["title"],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
