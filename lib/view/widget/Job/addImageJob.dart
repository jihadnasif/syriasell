import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../controller/Jobs/AddJobOppController.dart';
import '../../../core/constant/variable.dart';

class AddimgJob extends GetView<JobAddOppController> {
  const AddimgJob({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobAddOppController>(
      builder: (controller) {
        return InkWell(
          onTap: () {
            controller.optionImage(); // بدون index
          },
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            width: getValueForScreenType<double>(
              context: context,
              mobile: sizedWidth(context) * 0.25,
              tablet: sizedWidth(context) * 0.2,
              desktop: sizedWidth(context) * 0.15,
            ),
            height: getValueForScreenType<double>(
              context: context,
              mobile: sizeHeight(context) * 0.12,
              tablet: sizeHeight(context) * 0.2,
              desktop: sizeHeight(context) * 0.2,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 2,
              ),
            ),
            child: controller.file != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(
                      controller.file!,
                      fit: BoxFit.contain,
                    ),
                  )
                : controller.webImageBytes != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.memory(
                          controller.webImageBytes!,
                          fit: BoxFit.contain,
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add,
                            color: Colors.grey,
                          ),
                          Text(
                            "89".tr,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
          ),
        );
      },
    );
  }
}
