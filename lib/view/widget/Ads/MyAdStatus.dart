import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/LinkApp.dart';
import 'package:syria_sell/core/constant/AppColor.dart';

import '../../../core/functions/imageNetwork.dart';

class MyAdStatus extends StatelessWidget {
  const MyAdStatus({
    super.key,
    this.imagePath,
    this.departmentName,
    this.itemsNam,
    this.price,
    this.textAdStatus,
    this.adTime,
    this.colorIcon,
    this.onPressDelete,
    this.onTapInkWell,
  });
  final void Function()? onTapInkWell;
  final String? imagePath;
  final String? departmentName;
  final String? itemsNam;
  final String? price;
  final String? textAdStatus;
  final String? adTime;
  final Color? colorIcon;
  final void Function()? onPressDelete;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTapInkWell,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 2, color: Colors.grey.shade300),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    height: 90,
                    child: cachedNetworkImage(
                      imageUrl: "${LinkApp.uploadItems}$imagePath",
                      fit: BoxFit.contain,
                      errorWidget: Icon(Icons.broken_image, size: 40),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("${"81".tr} | "),
                          Text("$departmentName"),
                        ],
                      ),
                      Text(
                        "$itemsNam",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text("$price"),
                      Text(
                        "$adTime",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 2),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("$textAdStatus"),
                        Icon(
                          Icons.circle,
                          color: colorIcon,
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: onPressDelete,
                      icon: Icon(
                        Icons.delete,
                        color: Kcolor().kred,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
