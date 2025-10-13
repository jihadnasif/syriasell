import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/AppColor.dart';

class RowAdsIconText extends StatelessWidget {
  const RowAdsIconText({
    super.key,
    this.myAlignment,
    this.text,
    this.onPress,
    this.icon,
    this.isTextWrap = false, // ✅ افتراضيًا لا يلف
  });
  final MainAxisAlignment? myAlignment;
  final String? text;
  final void Function()? onPress;
  final Icon? icon;
  final bool isTextWrap; // ✅ خاصية جديدة
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: myAlignment ?? MainAxisAlignment.start,
      children: [
        isTextWrap
            ? Expanded(
                child: Text(
                  text!,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    color: Kcolor().kTitleText,
                  ),
                ),
              )
            : Text(
                text!,
                style: TextStyle(
                  color: Kcolor().kTitleText,
                ),
              ),
        IconButton(
          onPressed: onPress,
          icon: icon!,
        ),
      ],
    );
  }
}
