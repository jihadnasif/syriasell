import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:syria_sell/core/class/StatusRequest.dart';
import 'package:syria_sell/core/constant/AppimageAsset.dart';

import '../constant/sized.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView({
    Key? key,
    required this.statusRequest,
    required this.widget,
  }) : super(key: key);
  final StatusRequest statusRequest;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Lottie.asset(ImageAsset.newLoding, fit: BoxFit.contain),
            ],
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close, size: 50),
                  ),
                  Lottie.asset(ImageAsset.KlottieOffline, fit: BoxFit.contain),
                ],
              )
            : statusRequest == StatusRequest.serverfailure
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.close, size: 50),
                      ),
                      Lottie.asset(ImageAsset.KlottieErrorServer,
                          fit: BoxFit.contain),
                    ],
                  )
                : statusRequest == StatusRequest.failure
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.close, size: 50),
                          ),
                          Lottie.asset(
                            ImageAsset.KlottieNoData,
                            fit: BoxFit.scaleDown /*repeat: false*/,
                          ),
                        ],
                      )
                    : widget;
  }
}

//-----------for post i dount have get data so i dont need (no data)
class HandlingDataRequest extends StatelessWidget {
  const HandlingDataRequest({
    Key? key,
    required this.statusRequest,
    required this.widget,
  }) : super(key: key);
  final StatusRequest statusRequest;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? WidgetLottie(childLottie: Lottie.asset(ImageAsset.newLoding))
        : statusRequest == StatusRequest.offlinefailure
            ? WidgetLottie(childLottie: Lottie.asset(ImageAsset.KlottieOffline))
            : statusRequest == StatusRequest.serverfailure
                ? WidgetLottie(
                    childLottie: Lottie.asset(ImageAsset.KlottieErrorServer))
                : widget;
  }
}

class WidgetLottie extends StatelessWidget {
  const WidgetLottie({Key? key, required this.childLottie}) : super(key: key);
  final Widget childLottie;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: SizedLottieWidth(context),
        child: childLottie,
      ),
    );
  }
}
