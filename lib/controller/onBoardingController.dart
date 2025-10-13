import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:syria_sell/core/services/services.dart';
import 'package:syria_sell/data/datasource/static/static.dart';

import '../core/constant/routes.dart';

// abstract class is Expresses method
abstract class OnBoardingController extends GetxController {
  // next method for change slider Through onPressButton
  next();
  // onChangePageView method for change slider Through PageView.Builder
  onChangePageView(int i);
}

// class OnBoardingControllerImp extends OnBoardingController
// so: 1- like extends GetxController
//  2- must count all method the are in OnBoardingController
class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;
  MyServices myServices = Get.find();
  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      Get.offAllNamed(AppRoute.rSignUp);
    } else {
      pageController.animateToPage(currentPage,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
      print(currentPage);
    }
  }

  @override
  onChangePageView(int i) {
    currentPage = i;
    // for show changed on ui
    update();
  }

  @override
  void onInit() {
    print(currentPage);
    pageController = PageController();
    super.onInit();
  }
}
