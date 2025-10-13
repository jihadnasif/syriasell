import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/variable.dart';

class BoxMyAds extends StatelessWidget {
  const BoxMyAds({
    super.key,
    this.iconData,
    this.textOne,
    this.textTwo,
  });
  final IconData? iconData;
  final String? textOne;
  final String? textTwo;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: sizedWidth(context) * 0.26,
      margin: EdgeInsets.only(
        right: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(
          color: Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(iconData),
          Text(textOne!),
          Text(textTwo!),
        ],
      ),
    );
  }
}
