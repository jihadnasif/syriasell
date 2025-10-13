import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:syria_sell/controller/Home/ControllerHomeUser.dart';

import '../../../core/constant/AppColor.dart';
import '../../../core/constant/AppimageAsset.dart';
import '../../../core/constant/variable.dart';
import '../../../core/functions/Dialog.dart';

class ListBiddingAdsHome extends GetView<ControllerHomeUserImp> {
  ListBiddingAdsHome({super.key});
  final List<String> biddingImages = [
    "${ImageAsset.kPaidAuctions}/shoes.png",
    "${ImageAsset.kPaidAuctions}/motorcycle.png",
    "${ImageAsset.kPaidAuctions}/laptop.png",
    "${ImageAsset.kPaidAuctions}/car1.png",
    "${ImageAsset.kPaidAuctions}/camera.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: EdgeInsets.all(8),
      //color: Kcolor().kblack,
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: biddingImages.length,
        itemBuilder: (context, index) {
          return BiddingAdsHome(
            imagePath: biddingImages[index % biddingImages.length],
          );
        },
      ),
    );
  }
}

class BiddingAdsHome extends GetView<ControllerHomeUserImp> {
  final String imagePath; // مسار الصورة الديناميكي
  const BiddingAdsHome({Key? key, required this.imagePath})
      : super(key: key); // 2. إضافته كـ named parameter

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("ssssssssssssss");
        showInfoDialog(
          "203".tr,
          "204".tr,
          dialogType: DialogType.info,
          autoHid: Duration(seconds: 3),
        );
      },
      child: Container(
        width: getValueForScreenType<double>(
          context: context,
          mobile: sizedWidth(context) * 0.5,
          tablet: sizedWidth(context) * 0.3,
          desktop: sizedWidth(context) * 0.2,
        ),

        margin: const EdgeInsets.only(left: 4, bottom: 4), // هامش بسيط للظل
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Kcolor().shadow,
              offset: const Offset(-5, 5), // يسار وأسفل فقط
              blurRadius: 6,
              spreadRadius: 0.5,
            ),
          ],
          border: Border.all(
            color: Colors.grey.shade200,
            width: 2.0,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned(
                bottom: sizeHeight(context) * 0.13,
                right: sizedWidth(context) * 0.03,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  color: Kcolor().kicon,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.person, color: Kcolor().kwhite),
                      Text("34", style: TextStyle(color: Kcolor().kwhite)),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: sizeHeight(context) * 0.07,
                right: sizedWidth(context) * 0.12,
                height: sizeHeight(context) * 0.09,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                bottom: sizeHeight(context) * 0.01,
                right: sizedWidth(context) * 0.05,
                child: Column(
                  children: [
                    Text("4".tr, style: const TextStyle(fontSize: 12)),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.access_time, color: Kcolor().kred, size: 14),
                        const SizedBox(width: 5),
                        Text("34",
                            style:
                                TextStyle(color: Kcolor().kred, fontSize: 12)),
                      ],
                    ),
                    Text("\$ " + "103".tr,
                        style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
