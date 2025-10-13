import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/core/constant/AppColor.dart';

import '../../../core/constant/routes.dart';

class Greenpage extends StatelessWidget {
  const Greenpage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        Get.offAllNamed(AppRoute.rOnBoarding);
      });
    });
    return Scaffold(
      body: Container(
        color: Kcolor().kPrimaryColor,
      ),
    );
  }
}
