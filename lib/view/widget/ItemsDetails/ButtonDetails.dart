import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/variable.dart';

class ButtonDetails extends StatelessWidget {
  const ButtonDetails({
    super.key,
    this.onTap,
    this.colorButton,
    this.text,
    this.fontSize,
    this.fontWeight,
  });
  final void Function()? onTap;
  final Color? colorButton;
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          left: 10,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: sizedWidth(context) * 0.05,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: colorButton,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                text!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: fontWeight ?? FontWeight.bold,
                  fontSize: fontSize ?? 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
