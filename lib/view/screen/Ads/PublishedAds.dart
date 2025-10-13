import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:syria_sell/controller/Ads/PublishedAdsController.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/constant/variable.dart';
import 'package:syria_sell/core/functions/Dialog.dart';
import 'package:syria_sell/view/widget/Ads/BoxMyAds.dart';
import 'package:syria_sell/view/widget/Ads/ButtonMyAds.dart';
import 'package:syria_sell/view/widget/Ads/MyAdStatus.dart';
import 'package:syria_sell/view/widget/Auth/CustomButtonAuth.dart';
import 'package:syria_sell/view/widget/Home/HeaderHomeTitle.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/AppimageAsset.dart';
import '../../../core/functions/DialogAdds.dart';
import '../../widget/Home/BottomTap.dart';

class PublishedAds extends StatelessWidget {
  const PublishedAds({super.key});
  @override
  Widget build(BuildContext context) {
    PublishedAdsControllerImp controller = Get.put(PublishedAdsControllerImp());
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
      bottomNavigationBar: BottomTap(
        coloIcone3: Kcolor().KlightBlueAccent,
      ),
      body: GetBuilder<PublishedAdsControllerImp>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.loading) {
            return Center(
              child: Lottie.asset(ImageAsset.newLoding, fit: BoxFit.contain),
            );
          }

          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: RefreshIndicator(
              onRefresh: () async {
                await controller
                    .refreshData(); // تابع جديد في الكونترولر لتحديث البيانات
              },
              child: ListView(
                padding: EdgeInsets.all(0),
                children: [
                  HeaderHomeTitle(
                    textTile: "55".tr,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    color: Colors.grey.shade200,
                    height: sizeHeight(context) * 0.1,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ButtonMyAds(
                            onTap: () {
                              controller.goToPublishedAds();
                            },
                            colorButton: Kcolor().kPrimaryColor,
                            text: "76".tr,
                          ),
                          ButtonMyAds(
                            onTap: () {
                              controller.goToReviewAds();
                            },
                            colorButton: Kcolor().kButtonHome,
                            text: "77".tr,
                          ),
                          ButtonMyAds(
                            onTap: () {
                              controller.goToMyOppJobs();
                            },
                            colorButton: Kcolor().kButtonHome,
                            text: "191".tr,
                          ),
                          ButtonMyAds(
                            onTap: () {
                              controller.goToMyAppJobs();
                            },
                            colorButton: Kcolor().kButtonHome,
                            text: "192".tr,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BoxMyAds(
                        iconData: Icons.storefront,
                        textOne: "${controller.listPublishedOrders.length}",
                        textTwo: "51".tr,
                      ),
                      BoxMyAds(
                        iconData: Icons.visibility,
                        textOne: "0",
                        textTwo: "79".tr,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sizeHeight(context) * 0.1,
                  ),
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 800),
                      child: Column(
                        children: [
                          ...List.generate(
                              controller.listPublishedOrders.length, (index) {
                            return MyAdStatus(
                              onTapInkWell: () {
                                controller.goToItemDetails(controller
                                    .listPublishedOrders[index].itemId
                                    .toString());
                              },
                              imagePath:
                                  "${controller.listPublishedOrders[index].imageOne}",
                              departmentName:
                                  "${controller.listPublishedOrders[index].itemCategName}",
                              itemsNam:
                                  "${controller.listPublishedOrders[index].itemNameAr}",
                              price:
                                  "${controller.listPublishedOrders[index].finalPrice}",
                              adTime:
                                  "${controller.listPublishedOrders[index].itemDate}",
                              textAdStatus:
                                  "${controller.listPublishedOrders[index].orderStatusName}",
                              colorIcon: Kcolor().kicon,
                              onPressDelete: () {
                                showInfoDialog(
                                  "153".tr,
                                  "165".tr,
                                  cancelButtonText: "162".tr,
                                  onCancelPress: () {},
                                  dialogType: DialogType.warning,
                                  okButtonText: "156".tr,
                                  onOkPress: () {
                                    controller.deleteOrder({
                                      "ordersid": controller
                                          .listPublishedOrders[index].ordersId
                                          .toString(),
                                      "usersid": controller
                                          .listPublishedOrders[index].userId
                                          .toString(),
                                      "itemid": controller
                                          .listPublishedOrders[index].itemId
                                          .toString(),
                                    });
                                  },
                                );
                              },
                            );
                          }),
                          SizedBox(
                            height: sizeHeight(context) * 0.1,
                          ),
                          CustomButtonAuth(
                            onpressed: () {
                              controller.goToAddAd();
                            },
                            textButton: "54".tr,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ----Column or AdStatus----

                  // ---- End AdStatus--------

                  SizedBox(
                    height: sizeHeight(context) * 0.1,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
