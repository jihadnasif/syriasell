import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/controller/onBoardingController.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/data/datasource/static/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              onBoardingList.length,
              (index) {
                return AnimatedContainer(
                  margin: EdgeInsets.only(right: 15),
                  duration: Duration(milliseconds: 900),
                  width: controller.currentPage == index ? 44 : 33,
                  height: controller.currentPage == index ? 11 : 9,
                  decoration: BoxDecoration(
                    color: Kcolor().kSecondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
