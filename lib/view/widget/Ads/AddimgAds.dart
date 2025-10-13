import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:syria_sell/controller/Ads/AddFullAdController.dart';

import '../../../core/constant/variable.dart';

class AddimgAds extends GetView<AddAdFullControllerImp> {
  const AddimgAds({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAdFullControllerImp>(
      builder: (controller) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(4, (index) {
              return InkWell(
                onTap: () {
                  controller.optionImage(index);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  width: getValueForScreenType<double>(
                    context: context,
                    mobile: sizedWidth(context) * 0.18,
                    tablet: sizedWidth(context) * 0.15,
                    desktop: sizedWidth(context) * 0.1,
                  ),
                  height: getValueForScreenType<double>(
                    context: context,
                    mobile: sizeHeight(context) * 0.1,
                    tablet: sizeHeight(context) * 0.15,
                    desktop: sizeHeight(context) * 0.2,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: controller.images[index] != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.file(
                            controller.images[index]!,
                            fit: BoxFit.contain,
                          ),
                        )
                      : controller.webImagesBytes[index] != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.memory(
                                controller.webImagesBytes[index]!,
                                fit: BoxFit.contain,
                              ),
                            )
                          : index == 0
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      "89".tr,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                )
                              : null,
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
