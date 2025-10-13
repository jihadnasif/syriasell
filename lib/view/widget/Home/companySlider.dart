import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../LinkApp.dart';
import '../../../controller/Home/ControllerHomeUser.dart';
import '../../../core/constant/variable.dart';
import '../../../core/functions/imageNetwork.dart';
import '../../screen/Ads/Fullimage.dart';

class CustomImageSlider extends StatelessWidget {
  final double height;
  final bool autoPlay;

  const CustomImageSlider({
    Key? key,
    this.height = 200,
    this.autoPlay = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ControllerHomeUserImp>();

    return Container(
      margin: EdgeInsets.only(top: 5),
      child: CarouselSlider(
        options: CarouselOptions(
          height: height,
          autoPlay: autoPlay,
          autoPlayInterval: const Duration(seconds: 3),
          enlargeCenterPage: true,
          viewportFraction: 0.9,
        ),
        items: controller.listSliders.map((slider) {
          String imageUrl = "${LinkApp.SlidersCompany}${slider.imageName}";
          return GestureDetector(
            onTap: () {
              Get.to(() => ImageFullPage(
                    imagePath: imageUrl,
                  ));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: cachedNetworkImage(
                imageUrl: "${LinkApp.SlidersCompany}${slider.imageName}",
                width: double.infinity,
                height: sizeHeight(context) * 0.13,
                fit: BoxFit.contain,
                errorWidget: Icon(Icons.broken_image, size: 40),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
