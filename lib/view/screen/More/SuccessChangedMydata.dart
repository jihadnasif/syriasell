import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/core/constant/AppimageAsset.dart';
import 'package:syria_sell/core/constant/variable.dart';
import 'package:syria_sell/view/widget/Auth/CustomTextBodyAuth.dart';
import 'package:syria_sell/view/widget/Auth/CustomTextTitleAth.dart';

import '../../../../core/constant/AppColor.dart';
import '../../../controller/MorePageController/MorePageController.dart';
import '../../widget/Auth/CustomButtonAuth.dart';

class SuccessChagedMydata extends StatelessWidget {
  const SuccessChagedMydata({super.key});

  @override
  Widget build(BuildContext context) {
    MorePageControllerImp controller = Get.put(MorePageControllerImp());
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(0),
        children: [
          Container(
            height: 112,
            color: Kcolor().kHeader,
          ),
          SizedBox(height: sizeHeight(context) * 0.1),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: Column(
                children: [
                  Image.asset(
                    "${ImageAsset.KrootImageIcons}/Illustration2.png",
                    width: 327,
                    height: 172,
                  ),
                  SizedBox(height: sizeHeight(context) * 0.1),
                  CustomTextTilteAuth(
                    textTitle: "170".tr,
                  ),
                  CustomTextBodyAuth(
                    textBody: "171".tr,
                  ),
                  SizedBox(height: sizeHeight(context) * 0.1),
                  CustomButtonAuth(
                    onpressed: () {
                      controller.goToSignIn();
                    },
                    textButton: "41".tr,
                  ),
                  SizedBox(height: sizeHeight(context) * 0.1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
