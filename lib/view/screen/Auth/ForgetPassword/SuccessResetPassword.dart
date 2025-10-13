import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/core/constant/AppimageAsset.dart';
import 'package:syria_sell/core/constant/variable.dart';
import 'package:syria_sell/view/widget/Auth/CustomTextBodyAuth.dart';
import 'package:syria_sell/view/widget/Auth/CustomTextTitleAth.dart';

import '../../../../controller/Auth/ControllerForgetPassword/ControllerSuccessRePass.dart';
import '../../../../core/constant/AppColor.dart';
import '../../../widget/Auth/CustomButtonAuth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerSuccessRePassImp controller =
        Get.put(ControllerSuccessRePassImp());
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
              constraints: BoxConstraints(maxWidth: 500),
              child: Column(
                children: [
                  Image.asset(
                    "${ImageAsset.KrootImageIcons}/Illustration2.png",
                    width: 327,
                    height: 172,
                  ),
                  SizedBox(height: sizeHeight(context) * 0.1),
                  CustomTextTilteAuth(
                    textTitle: "29".tr,
                  ),
                  CustomTextBodyAuth(
                    textBody: "30".tr,
                  ),
                  SizedBox(height: sizeHeight(context) * 0.1),
                  CustomButtonAuth(
                    onpressed: () {
                      controller.GoToSignIn();
                    },
                    textButton: "6".tr,
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
