import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/controller/onBoardingController.dart';
import 'package:syria_sell/core/constant/AppTextTheme.dart';
import 'package:syria_sell/data/datasource/static/static.dart';

// GetView<OnBoardingControllerImp> for listen from OnBoardingControllerImp
// GetView <nameController> when i dont rfresh page
class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (index) {
        //print(index);
        controller.onChangePageView(index);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "${onBoardingList[index].imageUrl}",
                  height: MediaQuery.of(context).size.height * 0.31,
                  width: MediaQuery.of(context).size.height * 0.25,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 80,
                ),
                Text(
                  "${onBoardingList[index].title}",
                  style: KTextTheme().headTitle1,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
