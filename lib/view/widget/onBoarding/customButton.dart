import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/controller/onBoardingController.dart';
import 'package:syria_sell/core/constant/AppColor.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 35),
      height: 40,
      child: MaterialButton(
        onPressed: () {
          controller.next();
        },
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        color: Kcolor().kPrimaryColor,
        child: Text(
          "88".tr,
          style: TextStyle(
            color: Kcolor().kwhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
