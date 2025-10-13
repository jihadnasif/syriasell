import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:syria_sell/controller/Home/ControllerHomeUser.dart';
import 'package:syria_sell/core/class/StatusRequest.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/constant/routes.dart';
import 'package:syria_sell/core/constant/variable.dart';
import 'package:syria_sell/core/functions/translateDataBase.dart';
import 'package:syria_sell/view/widget/Home/BottomTap.dart';
import 'package:syria_sell/view/widget/Home/companySlider.dart';

import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/AppimageAsset.dart';
import '../../../core/functions/DialogAdds.dart';
import '../../widget/Home/CardDrawer.dart';
import '../../widget/Home/HeaderOnlyHome.dart';
import '../../widget/Home/HomrButton.dart';
import '../../widget/Home/ListBiddingAdsHome.dart';
import '../../widget/Home/ListSearch.dart';
import '../../widget/Home/SectionTwo.dart';
import '../../widget/Home/SectionsOne.dart';
import '../../widget/Home/TextHome.dart';
import '../../widget/Home/searshAouto.dart';

class HomeUser extends StatelessWidget {
  const HomeUser({super.key});
  @override
  Widget build(BuildContext context) {
    ControllerHomeUserImp controller = Get.put(ControllerHomeUserImp());
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
        coloIcone1: Kcolor().KlightBlueAccent,
      ),
      drawer: Builder(
        builder: (context) => GetBuilder<ControllerHomeUserImp>(
          builder: (controller) {
            // أثناء تحميل البيانات من السيرفر
            if (controller.statusRequest == StatusRequest.loading) {
              return Center(
                child: Lottie.asset(ImageAsset.newLoding, fit: BoxFit.contain),
              );
            }

            // بعد تحميل البيانات
            return Container(
              width: getValueForScreenType<double>(
                context: context,
                mobile: sizedWidth(context) * 0.4,
                tablet: sizedWidth(context) * 0.3,
                desktop: sizedWidth(context) * 0.2,
              ),
              height: getValueForScreenType<double>(
                context: context,
                mobile: sizeHeight(context) * 0.7,
                tablet: sizeHeight(context) * 0.7,
                desktop: sizeHeight(context) * 0.8,
              ),
              color: Kcolor().kwhite,
              child: ListView(
                children: [
                  Card(
                    child: Text(
                      "46".tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ...List.generate(
                    controller.listCateg.length,
                    (index) {
                      var item = controller.listCateg[index];
                      return CardDrawer(
                        onTap: () {
                          controller.goToItemsCategId(
                            item.id!,
                            translateDataBase(item.name!, item.nameAr!),
                            item.image!,
                          );
                        },
                        iconData: Icons.arrow_forward_ios,
                        text: translateDataBase(item.name!, item.nameAr!),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      body: Builder(
        // ⬅️ هذا مهم للحصول على context الصحيح
        builder: (context) => GetBuilder<ControllerHomeUserImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: !controller.isSearch
                ? RefreshIndicator(
                    onRefresh: () async {
                      await controller
                          .refreshData(); // تابع جديد في الكونترولر لتحديث البيانات
                    },
                    child: ListView(
                      padding: EdgeInsets.all(0),
                      children: [
                        HeaderOnlyHome(
                          textTile: "41".tr,
                          iconLeading: Icon(Icons.menu),
                          functionLeading: () {
                            Scaffold.of(context).openDrawer();
                          },
                          trailing2: "job2.png",
                          functionTrailing2: () {
                            Get.toNamed(AppRoute.rViewJopOpportunity);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                  height: 30,
                                ),

                                //------------------
                                SearchAutocompleteWidget(
                                    controller: controller),

                                // 🔍 انتهى البحث
                                //-------------------

                                SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TitlePageHome(
                                        onTap: () {},
                                        text: "44".tr,
                                      ),
                                      TitlePageHome(
                                        onTap: () {},
                                        text: "43".tr,
                                      ),
                                    ],
                                  ),
                                ),

                                ListBiddingAdsHome(),

                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        HomeButton(
                          onpressed: () {},
                          textButton: "45".tr,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitlePageHome(
                                onTap: () {},
                                text: "46".tr,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ...List.generate(
                                (controller.listCateg.length / 3).ceil(),
                                (index) {
                                  int firstIndex = index * 3;
                                  int secondIndex = firstIndex + 1;
                                  int thirdIndex = firstIndex + 2;

                                  // إذا لم يكن هناك أي عنصر في هذا السكشن، لا تعرضه
                                  if (firstIndex >= controller.listCateg.length)
                                    return SizedBox.shrink();

                                  // جلب الصور والنصوص إذا موجودة
                                  String? imageOne =
                                      controller.listCateg[firstIndex].image;
                                  String? textOne = translateDataBase(
                                      controller.listCateg[firstIndex].name,
                                      controller.listCateg[firstIndex].nameAr);
                                  int? idOne =
                                      controller.listCateg[firstIndex].id;

                                  String? imageTwo = secondIndex <
                                          controller.listCateg.length
                                      ? controller.listCateg[secondIndex].image
                                      : null;
                                  String? textTwo =
                                      secondIndex < controller.listCateg.length
                                          ? translateDataBase(
                                              controller
                                                  .listCateg[secondIndex].name,
                                              controller.listCateg[secondIndex]
                                                  .nameAr)
                                          : null;
                                  int? idTwo =
                                      secondIndex < controller.listCateg.length
                                          ? controller.listCateg[secondIndex].id
                                          : null;

                                  String? imageThree = thirdIndex <
                                          controller.listCateg.length
                                      ? controller.listCateg[thirdIndex].image
                                      : null;
                                  String? textThree = thirdIndex <
                                          controller.listCateg.length
                                      ? translateDataBase(
                                          controller.listCateg[thirdIndex].name,
                                          controller
                                              .listCateg[thirdIndex].nameAr)
                                      : null;
                                  int? idThree =
                                      thirdIndex < controller.listCateg.length
                                          ? controller.listCateg[thirdIndex].id
                                          : null;

                                  if (index % 2 == 0) {
                                    // SectionsOne
                                    return SectionsOne(
                                      imageColRowOne: imageOne,
                                      textColRowOne: textOne,
                                      ontapColRowOne: () {
                                        controller.goToItemsCategId(
                                            idOne!, textOne!, imageOne!);
                                      },
                                      imageColRowTow: imageTwo ?? "",
                                      textColRowTow: textTwo ?? "",
                                      ontapColRowTow: () {
                                        controller.goToItemsCategId(
                                            idTwo!, textTwo!, imageTwo!);
                                      },
                                      imageColumn: imageThree ?? "",
                                      textColumn: textThree ?? "",
                                      ontapColumn: () {
                                        controller.goToItemsCategId(
                                            idThree!, textThree!, imageThree!);
                                      },
                                    );
                                  } else {
                                    // SectionsTow
                                    return Column(
                                      children: [
                                        SizedBox(
                                          height: 25,
                                        ),
                                        SectionsTwo(
                                          imageColRowOne: imageOne,
                                          textColRowOne: textOne,
                                          ontapColRowOne: () {
                                            controller.goToItemsCategId(
                                                idOne!, textOne!, imageOne!);
                                          },
                                          imageColRowTow: imageTwo ?? "",
                                          textColRowTow: textTwo ?? "",
                                          ontapColRowTow: () {
                                            controller.goToItemsCategId(
                                                idTwo!, textTwo!, imageTwo!);
                                          },
                                          imageColumn: imageThree ?? "",
                                          textColumn: textThree ?? "",
                                          ontapColumn: () {
                                            controller.goToItemsCategId(
                                                idThree!,
                                                textThree!,
                                                imageThree!);
                                          },
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                      ],
                                    );
                                  }
                                },
                              ),
                              SizedBox(
                                height: 100,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : ListDataModelSearch(
                    listDataModelsearch: controller.listItemsSearch,
                  ),
          ),
        ),
      ),
    );
  }
}
