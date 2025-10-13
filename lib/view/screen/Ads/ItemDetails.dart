import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:syria_sell/controller/Ads/ItemDetalisController.dart';
import 'package:syria_sell/view/widget/Home/HeaderHomeTitle.dart';
import 'package:syria_sell/view/widget/ItemsDetails/CardDetails.dart';
import 'package:syria_sell/view/widget/ItemsDetails/SliderClipRect.dart';
import 'package:uuid/uuid.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/AppColor.dart';
import '../../../core/constant/AppimageAsset.dart';
import '../../../core/constant/variable.dart';
import '../../../core/functions/DialogAdds.dart';
import '../../../core/functions/linkWhatsApp.dart';
import '../../../core/functions/timeAgo.dart';
import '../../../core/shared/ShareAndLinks.dart';
import '../../widget/Comments/CommentsSection.dart';
import '../../widget/Home/BottomTap.dart';
import '../../widget/ItemsDetails/ButtonDetails.dart';
import '../../widget/car/CarCardDetails.dart';
import 'Fullimage.dart';

var uuid = Uuid();

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemDetailsController controller = Get.put(ItemDetailsController());
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
      body: GetBuilder<ItemDetailsController>(
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
                      textTile: "137".tr,
                      iconTrailing: Icon(Icons.arrow_forward),
                      functionTrailing: () {
                        Get.back(result: true);
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.imagesSlider.isNotEmpty
                            ? (controller.imagesSlider.length == 1
                                ? SizedBox(
                                    height: getValueForScreenType<double>(
                                      context: context,
                                      mobile: sizeHeight(context) * 0.25,
                                      tablet: sizeHeight(context) * 0.3,
                                      desktop: sizeHeight(context) * 0.4,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(() => ImageFullPage(
                                              imagePath:
                                                  controller.imagesSlider[0],
                                            ));
                                      },
                                      child: SliderClipRect(
                                        imagePath: controller.imagesSlider[0],
                                      ),
                                    ),
                                  )
                                : CarouselSlider(
                                    options: CarouselOptions(
                                      height: getValueForScreenType<double>(
                                        context: context,
                                        mobile: sizeHeight(context) * 0.25,
                                        tablet: sizeHeight(context) * 0.3,
                                        desktop: sizeHeight(context) * 0.4,
                                      ),
                                      autoPlayAnimationDuration:
                                          Duration(seconds: 3),
                                      autoPlay: true,
                                      enlargeCenterPage: true,
                                      viewportFraction: 0.9,
                                    ),
                                    items: controller.imagesSlider
                                        .map((imagePath) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.to(() => ImageFullPage(
                                                imagePath: imagePath,
                                              ));
                                        },
                                        child: SliderClipRect(
                                          imagePath: imagePath,
                                        ),
                                      );
                                    }).toList(),
                                  ))
                            : SizedBox.shrink(),
                        SizedBox(
                          height: 20,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 500),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                timeAgo(
                                  DateTime.parse(
                                      controller.viewItemsAllModel!.itemDate!),
                                ),
                                style: TextStyle(fontSize: 20),
                              ),
                              IconButton(
                                onPressed: () {
                                  if (controller.isFavorites[controller
                                          .viewItemsAllModel!.itemId] ==
                                      1) {
                                    controller.setFavorite(
                                        controller.viewItemsAllModel!.itemId!,
                                        0);
                                    controller.removeFavorite(
                                        controller.viewItemsAllModel!.itemId!);
                                  } else {
                                    controller.setFavorite(
                                        controller.viewItemsAllModel!.itemId!,
                                        1);
                                    controller.addFavorite(
                                        controller.viewItemsAllModel!.itemId!);
                                  }
                                },
                                icon: Icon(
                                  controller.isFavorites[controller
                                              .viewItemsAllModel?.itemId] ==
                                          1
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: Kcolor().KdeepOrange,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "${controller.viewItemsAllModel!.itemNameAr}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "${controller.viewItemsAllModel!.currencySymbol ?? "\$"}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${controller.viewItemsAllModel!.itemPrice}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                        GridView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: getValueForScreenType<int>(
                              context: context,
                              mobile: 3, // للموبايل
                              tablet: 5, // للتاب
                              desktop: 6, // للكمبوتر
                              //watch: 2, // للساعة
                            ),
                          ),
                          children: [
                            CardDetails(
                              title: "81".tr,
                              text:
                                  "${controller.viewItemsAllModel!.itemCategName}",
                            ),
                            CardDetails(
                              title: "138".tr,
                              text: "${controller.viewItemsAllModel!.itemCity}",
                            ),
                            CardDetails(
                              title: "129".tr,
                              text: "${controller.viewItemsAllModel!.itemArea}",
                            ),
                            CardDetails(
                              title: "130".tr,
                              text:
                                  "${controller.viewItemsAllModel!.itemStatus}",
                            ),
                            if (controller.viewItemsAllModel!.itemCategorieId ==
                                1)
                              ...carDetailsCards(controller.viewItemsAllModel!),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 1000),
                          child: TextFormField(
                            initialValue:
                                controller.viewItemsAllModel!.itemDetailsAr ??
                                    "",
                            maxLines: null,
                            readOnly: true, // قراءة فقط
                            decoration: InputDecoration(
                              labelText: "100".tr,
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
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            ButtonDetails(
                              text: "108".tr,
                              colorButton: Kcolor().whatsapp,
                              onTap: () {
                                openWhatsApp(
                                    "${controller.viewItemsAllModel!.phone ?? ""}");
                                print("-------------------");
                                print(controller.viewItemsAllModel!.phone);
                                print("-------------------");
                              },
                            ),
                            ButtonDetails(
                              text:
                                  controller.viewItemsAllModel!.phone == null ||
                                          controller
                                              .viewItemsAllModel!.phone!.isEmpty
                                      ? controller.viewItemsAllModel!.email
                                      : controller.viewItemsAllModel!.phone,
                              colorButton: Kcolor().kButtonHome,
                              onTap: () {
                                //controller.changeLang(0);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Obx(() => IconButton(
                                        icon: Icon(
                                          controller.isLiked.value
                                              ? Icons.thumb_up
                                              : Icons.thumb_up_off_alt,
                                          color: Colors.blue,
                                        ),
                                        onPressed: () =>
                                            controller.toggleLike(),
                                      )),
                                  Obx(() =>
                                      Text("${controller.likesCount.value}")),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  /// زر التعليقات
                                  IconButton(
                                    icon: Icon(Icons.chat, color: Colors.green),
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (_) => FractionallySizedBox(
                                          heightFactor: 0.8, // 80% من الشاشة
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            child: CommentsSection(),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Obx(() => Text(
                                      "${controller.commentsCount.value}")),
                                ],
                              ),
                            ),

                            /// زر المشاركة
                            /// أيقونة المشاركة
                            Expanded(
                              child: Row(
                                children: [
                                  IconButton(
                                    icon:
                                        Icon(Icons.share, color: Colors.orange),
                                    onPressed: () async {
                                      bool shared = await ShareAndLinks.shareAd(
                                        adId: controller
                                            .viewItemsAllModel!.itemId
                                            .toString(),
                                        adTitle: controller
                                            .viewItemsAllModel!.itemNameAr!,
                                        //routePath: "ad",
                                        //context: context,
                                        onShared: () {
                                          controller.shareCount.value++;
                                        },
                                      );

                                      // في حال أردت فعل شيء إضافي بعد المشاركة:
                                      if (shared) {
                                        print("تمت المشاركة بنجاح!");
                                      }
                                    },
                                  ),
                                  /*
                                  Obx(() =>
                                      Text("${controller.shareCount.value}")),
                                  */
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
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
