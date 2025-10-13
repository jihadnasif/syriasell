import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/controller/Auth/ControllerSuccessSignUp.dart';
import 'package:syria_sell/core/constant/AppimageAsset.dart';
import 'package:syria_sell/core/constant/variable.dart';
import 'package:syria_sell/view/widget/Auth/CustomTextBodyAuth.dart';
import 'package:syria_sell/view/widget/Auth/CustomTextTitleAth.dart';

import '../../../core/constant/AppColor.dart';
import '../../widget/Auth/CustomButtonAuth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerSuccessSignUpImp controller =
        Get.put(ControllerSuccessSignUpImp());
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
                  CircleAvatar(
                    radius: sizeHeight(context) * 0.1,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                        "${ImageAsset.KrootImageIcons}/Illustration.png"),
                  ),
                  SizedBox(height: sizeHeight(context) * 0.1),
                  CustomTextTilteAuth(
                    textTitle: "18".tr,
                  ),
                  CustomTextBodyAuth(
                    textBody: "19".tr,
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
