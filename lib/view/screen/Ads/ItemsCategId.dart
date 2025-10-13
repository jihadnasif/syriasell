import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:syria_sell/controller/Ads/ItemsCategoryIdController.dart';
import 'package:syria_sell/core/class/handlingdataview.dart';
import 'package:syria_sell/view/widget/Ads/CardItemsCategoryId.dart';
import 'package:syria_sell/view/widget/Home/HeaderHome.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../core/constant/AppColor.dart';
import '../../../core/constant/AppimageAsset.dart';
import '../../../core/constant/variable.dart';
import '../../../core/functions/DialogAdds.dart';
import '../../../core/functions/timeAgo.dart';
import '../../widget/Home/BottomTap.dart';
import '../../widget/Home/companySlider.dart';

class ItemsCategId extends StatelessWidget {
  const ItemsCategId({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemCategoryIdController());
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
      body: GetBuilder<ItemCategoryIdController>(
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
                  HeaderHome(
                    imagePath: controller.imagePath,
                    textTile: controller.categName,
                    iconTrailing: Icon(Icons.arrow_forward),
                    functionTrailing: () {
                      Get.back();
                    },
                  ),
                  CustomImageSlider(
                    height: getValueForScreenType<double>(
                      context: context,
                      mobile: sizeHeight(context) * 0.2,
                      tablet: sizeHeight(context) * 0.3,
                      desktop: sizeHeight(context) * 0.4,
                    ),
                    autoPlay: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GridView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getValueForScreenType<int>(
                        context: context,
                        mobile: 2, // للموبايل
                        tablet: 4, // للتاب
                        desktop: 5, // للكمبوتر
                        //watch: 2, // للساعة
                      ),
                    ),
                    children: [
                      ...List.generate(
                        controller.listItemsCategId.length,
                        (index) {
                          return CardItemsCategoryId(
                            urlImage:
                                controller.listItemsCategId[index].imageOne!,
                            title:
                                controller.listItemsCategId[index].itemNameAr!,
                            onclice: () {
                              controller.goToItemDetails(controller
                                  .listItemsCategId[index].itemId
                                  .toString());
                            },
                            timAgo: timeAgo(
                              DateTime.parse(
                                  controller.listItemsCategId[index].itemDate!),
                            ),
                            pric: controller.listItemsCategId[index].itemPrice
                                .toString(),
                            currency: controller
                                    .listItemsCategId[index].currencySymbol ??
                                "",
                          );
                        },
                      ),
                    ],
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
