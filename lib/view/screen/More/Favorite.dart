import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:syria_sell/view/widget/Ads/TitleH1Ads.dart';
import 'package:syria_sell/view/widget/Home/HeaderHomeTitle.dart';

import '../../../controller/Jobs/ViewJopApplicationControllrt.dart';
import '../../../controller/Jobs/ViewJopOpportunityController.dart';
import '../../../controller/MorePageController/FavoriteController.dart';
import '../../../core/class/StatusRequest.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/AppColor.dart';
import '../../../core/constant/AppimageAsset.dart';
import '../../../core/functions/goNewAds.dart';
import '../../../core/functions/timeAgo.dart';
import '../../widget/Ads/CardItemsCategoryId.dart';
import '../../widget/Favorite/CardApplicationid.dart';
import '../../widget/Favorite/CardOpportunityId.dart';
import '../../widget/Home/BottomTap.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteControllerImp controller = Get.put(FavoriteControllerImp());
    ViewJopApplicationControllerImp controllerAppJop =
        Get.put(ViewJopApplicationControllerImp());
    ViewJopOpportunityControllerImp controllerOppJop =
        Get.put(ViewJopOpportunityControllerImp());

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
      body: GetBuilder<FavoriteControllerImp>(
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
                  //---------الإعلانات المفضلة----------

                  HeaderHomeTitle(
                    textTile: "57".tr,
                    iconTrailing: Icon(Icons.arrow_forward),
                    functionTrailing: () {
                      Get.back();
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: TitleH1Ads(
                      textTitleH1: "51".tr,
                    ),
                  ),
                  GridView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getValueForScreenType<int>(
                        context: context,
                        mobile: 2, // للموبايل
                        tablet: 3, // للتاب
                        desktop: 4, // للكمبوتر
                        //watch: 2, // للساعة
                      ),
                      crossAxisSpacing: 5, // مسافة أفقية بين العناصر
                      mainAxisSpacing: 0, // مسافة عمودية بين الصفوف
                      childAspectRatio: getValueForScreenType<double>(
                        context: context,
                        mobile: 1,
                        tablet: 3 / 2,
                        desktop: 3 / 2,
                      ), // نسبة العرض إلى الارتفاع
                    ),
                    children: [
                      ...List.generate(
                        controller.data.length,
                        (index) {
                          return CardItemsCategoryId(
                            urlImage: controller.data[index].imageOne!,
                            title: controller.data[index].nameAr!,
                            onclice: () {
                              controller.goToItemDetails(
                                  controller.data[index].itemId.toString());
                            },
                            timAgo: timeAgo(
                              DateTime.parse(controller.data[index].date!),
                            ),
                            pric: controller.data[index].price.toString(),
                            currency:
                                controller.data[index].currencySymbol ?? "",
                          );
                        },
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: TitleH1Ads(
                      textTitleH1: "191".tr,
                    ),
                  ),
                  GridView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getValueForScreenType<int>(
                        context: context,
                        mobile: 1, // للموبايل
                        tablet: 2, // للتاب
                        desktop: 3, // للكمبوتر
                        //watch: 2, // للساعة
                      ),
                      crossAxisSpacing: 5, // مسافة أفقية بين العناصر
                      mainAxisSpacing: 0, // مسافة عمودية بين الصفوف
                      childAspectRatio: getValueForScreenType<double>(
                        context: context,
                        mobile: 3 / 2,
                        tablet: 5 / 4,
                        desktop: 3 / 2,
                      ), // نسبة العرض
                    ),
                    children: [
                      ...List.generate(
                        controller.dataOpp.length,
                        (index) {
                          return CardOpportunityid(
                            onClice: () {
                              controller.goToItemDetailsOpp(
                                  controller.dataOpp[index].jobId!);
                            },
                            specialization:
                                controller.dataOpp[index].specialization,
                            description: controller.dataOpp[index].description,
                            imagePath: controller.dataOpp[index].image,
                            companyName: controller.dataOpp[index].companyName,
                            city: controller.dataOpp[index].cityAr,
                            phone: controller.dataOpp[index].phone,
                          );
                        },
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: TitleH1Ads(
                      textTitleH1: "214".tr,
                    ),
                  ),
                  GridView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getValueForScreenType<int>(
                        context: context,
                        mobile: 1, // للموبايل
                        tablet: 2, // للتاب
                        desktop: 3, // للكمبوتر
                        //watch: 2, // للساعة
                      ),
                      crossAxisSpacing: 5, // مسافة أفقية بين العناصر
                      mainAxisSpacing: 0, // مسافة عمودية بين الصفوف
                      childAspectRatio: getValueForScreenType<double>(
                        context: context,
                        mobile: 3 / 2,
                        tablet: 1,
                        desktop: 5 / 4,
                      ), // نسبة العرض
                    ),
                    children: [
                      ...List.generate(
                        controller.dataApp.length,
                        (index) {
                          var job = controller.dataApp[index];
                          return CardApplicationid(
                            onClice: () {
                              controller.goToItemDetailsApp(
                                  controller.dataApp[index].jobId!);
                            },
                            specialization:
                                controller.dataApp[index].specialization,
                            description: controller.dataApp[index].description,
                            fullName: controller.dataApp[index].fullName,
                            city: controller.dataApp[index].cityAr,
                            phone: controller.dataApp[index].phoneNumber,
                            YearsExperience: controller
                                .dataApp[index].yearsOfExperience
                                .toString(),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
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
