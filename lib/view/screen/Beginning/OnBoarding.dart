import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/controller/onBoardingController.dart';
import 'package:syria_sell/view/widget/onBoarding/CustomDotController.dart';
import 'package:syria_sell/view/widget/onBoarding/customButton.dart';
import 'package:syria_sell/view/widget/onBoarding/customSlider.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: CustomSliderOnBoarding(),
          ),
          // this Expandes so I Separate between Expandend 1 and 2
          // this Expandend is const
          Expanded(
            flex: 1,
            child: Column(
              children: [
                CustomDotControllerOnBoarding(),
                Spacer(),
                CustomButtonOnBoarding(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
