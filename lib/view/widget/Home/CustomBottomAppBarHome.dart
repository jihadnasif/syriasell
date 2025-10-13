/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/view/widget/Home/CustomBottomAppbar.dart';

import '../../../controller/ControllerHomeScreen.dart';

class CustomBottomAbbBarHome extends StatelessWidget {
  const CustomBottomAbbBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerHomeScreenImp>(
      builder: (controller) => Container(
        color: Colors.grey.shade300,
        child: Container(
          margin: EdgeInsets.only(
            left: 25,
            right: 25,
            bottom: 16,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Kcolor().kHeader,
                Kcolor().kPrimaryColor,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.center,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            //shape: CircularNotchedRectangle(),
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, // توزيع متساوٍ
              children: List.generate(
                controller.listPage.length + 1,
                (index) {
                  int iSpacer = index > 2 ? index - 1 : index;
                  if (index == 2) {
                    // العنصر الذي يمثل زر الإضافة
                    return Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 24), // اترك مسافة للأسفل من الأيقونة
                          Text(
                            "53".tr,
                            style: TextStyle(
                              fontSize: 12,
                              color: Kcolor().kwhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Expanded(
                      child: CustomBottomAppBar(
                        textIcon: controller.bottomAppBar[iSpacer]["title"],
                        icon: controller.bottomAppBar[iSpacer]["icon"],
                        onPressed: () {
                          controller.changePage(iSpacer);
                        },
                        active: controller.currentPage == iSpacer,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/
