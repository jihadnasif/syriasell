import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/controller/Home/ControllerHomeUser.dart';
import 'package:syria_sell/core/constant/AppimageAsset.dart';
import 'package:syria_sell/core/constant/variable.dart';
import 'package:syria_sell/view/widget/Home/image.dart';

import '../../../core/constant/AppColor.dart';

class ListPaidProductsHome extends GetView<ControllerHomeUserImp> {
  const ListPaidProductsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: EdgeInsets.all(8),
      //color: Kcolor().kblack,

      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return PaidProductsHome();
        },
      ),
    );
  }
}

class PaidProductsHome extends GetView<ControllerHomeUserImp> {
  const PaidProductsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // تنفيذ عند الضغط
      },
      child: Container(
        width: sizedWidth(context) * 0.7,
        margin: const EdgeInsets.only(left: 4, bottom: 4), // مساحة للظل
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Kcolor().paidShadow,
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
              // ✅ الجزء العلوي: تدرج لوني أخضر - أبيض مع زوايا سفلية فقط
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 160,
                child: ClipPath(
                  clipper: BottomArcClipper(),
                  child: Image.asset(
                    "${ImageAsset.kprintscreen}/header2.jpg",
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
              ),

              // ✅ الجزء السفلي اليميني: صورة
              Positioned(
                bottom: 0,
                right: 0,
                width: 150,
                height: 150,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    ImageAsset.kPaidAcuMobile,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
