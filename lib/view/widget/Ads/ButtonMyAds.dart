import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/constant/variable.dart';

class ButtonMyAds extends StatelessWidget {
  const ButtonMyAds({
    super.key,
    this.onTap,
    this.colorButton,
    this.text,
  });
  final void Function()? onTap;
  final Color? colorButton;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          left: 5,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: sizedWidth(context) * 0.06,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: colorButton,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Kcolor().kwhite,
          ),
        ),
      ),
    );
  }
}
