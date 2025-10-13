import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:syria_sell/LinkApp.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/constant/variable.dart';
import 'package:syria_sell/core/utils/app_scale.dart';

import '../../../core/functions/imageNetwork.dart';

class SectionsOne extends StatelessWidget {
  const SectionsOne({
    super.key,
    this.imageColRowOne,
    this.textColRowOne,
    this.imageColRowTow,
    this.textColRowTow,
    this.imageColumn,
    this.textColumn,
    this.ontapColRowOne,
    this.ontapColRowTow,
    this.ontapColumn,
  });
  final String? imageColRowOne;
  final String? textColRowOne;
  final String? imageColRowTow;
  final String? textColRowTow;
  final String? imageColumn;
  final String? textColumn;
  final void Function()? ontapColRowOne;
  final void Function()? ontapColRowTow;
  final void Function()? ontapColumn;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        children: [
          Expanded(
            flex: 7, // 60%
            child: Column(
              children: [
                InkWell(
                  onTap: ontapColRowOne,
                  child: Container(
                    height: getValueForScreenType<double>(
                      context: context,
                      mobile: sizeHeight(context) * 0.12,
                      tablet: sizeHeight(context) * 0.2,
                      desktop: sizeHeight(context) * 0.25,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade200,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Kcolor().shadow,
                          offset: const Offset(-5, 5), // يسار وأسفل فقط
                          blurRadius: 6,
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        cachedNetworkImage(
                          imageUrl:
                              "${LinkApp.uploadCategories}$imageColRowOne",
                          width: getValueForScreenType<double>(
                            context: context,
                            mobile: sizedWidth(context) * 0.2,
                            tablet: sizedWidth(context) * 0.3,
                            desktop: sizedWidth(context) * 0.4,
                          ),
                          height: getValueForScreenType<double>(
                            context: context,
                            mobile: sizeHeight(context) * 0.1,
                            tablet: sizeHeight(context) * 0.2,
                            desktop: sizeHeight(context) * 0.3,
                          ),
                          fit: BoxFit.contain,
                          errorWidget: Icon(Icons.broken_image, size: 40),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          textColRowOne!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12 * AppScale.scale,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 15), // مسافة بين الكونتينرين

                InkWell(
                  onTap: ontapColRowTow,
                  child: Container(
                    height: getValueForScreenType<double>(
                      context: context,
                      mobile: sizeHeight(context) * 0.12,
                      tablet: sizeHeight(context) * 0.2,
                      desktop: sizeHeight(context) * 0.25,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade200,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Kcolor().shadow,
                          offset: const Offset(-5, 5), // يسار وأسفل فقط
                          blurRadius: 6,
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        cachedNetworkImage(
                          imageUrl:
                              "${LinkApp.uploadCategories}$imageColRowTow",
                          width: getValueForScreenType<double>(
                            context: context,
                            mobile: sizedWidth(context) * 0.23,
                            tablet: sizedWidth(context) * 0.3,
                            desktop: sizedWidth(context) * 0.4,
                          ),
                          height: getValueForScreenType<double>(
                            context: context,
                            mobile: sizeHeight(context) * 0.1,
                            tablet: sizeHeight(context) * 0.2,
                            desktop: sizeHeight(context) * 0.3,
                          ),
                          fit: BoxFit.contain,
                          errorWidget: SizedBox.shrink(),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          textColRowTow!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12 * AppScale.scale,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15), // مسافة بين القسمين
          Expanded(
            flex: 4,
            // 40%
            child: InkWell(
              onTap: ontapColumn,
              child: Container(
                height: getValueForScreenType<double>(
                  context: context,
                  mobile: sizeHeight(context) * 0.24,
                  tablet: sizeHeight(context) * 0.4,
                  desktop: sizeHeight(context) * 0.5,
                ), // مساوية للكونتينرين + الفراغ
                decoration: BoxDecoration(
                  color: Kcolor().kButtonHome,
                  border: Border.all(
                    color: Colors.grey.shade200,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Kcolor().shadow,
                      offset: const Offset(-5, 5), // يسار وأسفل فقط
                      blurRadius: 6,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    cachedNetworkImage(
                      imageUrl: "${LinkApp.uploadCategories}$imageColumn",
                      width: getValueForScreenType<double>(
                        context: context,
                        mobile: sizedWidth(context) * 0.23,
                        tablet: sizeHeight(context) * 0.3,
                        desktop: sizeHeight(context) * 0.4,
                      ),
                      height: getValueForScreenType<double>(
                        context: context,
                        mobile: sizeHeight(context) * 0.1,
                        tablet: sizeHeight(context) * 0.2,
                        desktop: sizeHeight(context) * 0.3,
                      ),
                      fit: BoxFit.contain,
                      errorWidget: SizedBox.shrink(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      textColumn!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12 * AppScale.scale,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
