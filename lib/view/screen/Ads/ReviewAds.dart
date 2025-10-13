import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:syria_sell/controller/Ads/ReviewAdsController.dart';
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

class ReviewAds extends StatelessWidget {
  const ReviewAds({super.key});
  @override
  Widget build(BuildContext context) {
    ReviewAdsControllerImp controller = Get.put(ReviewAdsControllerImp());
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
      body: GetBuilder<ReviewAdsControllerImp>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.loading) {
            return Center(
              child: Lottie.asset(ImageAsset.newLoding, fit: BoxFit.contain),
            );
          }
          return HandlingDataRequest(
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
                            colorButton: Kcolor().kButtonHome,
                            text: "76".tr,
                          ),
                          ButtonMyAds(
                            onTap: () {
                              controller.goToReviewAds();
                            },
                            colorButton: Kcolor().kPrimaryColor,
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
                        textOne: "${controller.listReviewOrders.length}",
                        textTwo: "51".tr,
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
                          ...List.generate(controller.listReviewOrders.length,
                              (index) {
                            return MyAdStatus(
                              onTapInkWell: () {
                                controller.goToItemDetails(controller
                                    .listReviewOrders[index].itemId
                                    .toString());
                              },
                              imagePath:
                                  "${controller.listReviewOrders[index].imageOne}",
                              departmentName:
                                  "${controller.listReviewOrders[index].itemCategName}",
                              itemsNam:
                                  "${controller.listReviewOrders[index].itemNameAr}",
                              price:
                                  "${controller.listReviewOrders[index].finalPrice}",
                              adTime:
                                  "${controller.listReviewOrders[index].itemDate}",
                              textAdStatus:
                                  "${controller.listReviewOrders[index].orderStatusName}",
                              colorIcon: Kcolor().kreview,
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
                                          .listReviewOrders[index].ordersId
                                          .toString(),
                                      "usersid": controller
                                          .listReviewOrders[index].userId
                                          .toString(),
                                      "itemid": controller
                                          .listReviewOrders[index].itemId
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

                  // ---- End AdStatus-------

                  // ---- End AdStatus-------

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
