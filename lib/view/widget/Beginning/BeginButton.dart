import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/constant/variable.dart';

class BegnButton extends StatelessWidget {
  const BegnButton({
    Key? key,
    this.onpressed,
    this.textButton,
  }) : super(key: key);
  final VoidCallback? onpressed;
  final String? textButton;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        margin: EdgeInsets.only(
          top: sizeHeight(context) * 0.04,
          left: sizedWidth(context) * 0.13,
          right: sizedWidth(context) * 0.13,
        ),
        padding: EdgeInsets.symmetric(
            vertical: sizeHeight(context) * 0.023,
            horizontal: sizedWidth(context) * 0.03),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Kcolor().kPrimaryColor, Kcolor().kSecondaryColor],
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${textButton}",
              style: TextStyle(
                fontSize: 18,
                color: Kcolor().kwhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: Kcolor().kwhite,
            ),
          ],
        ),
      ),
    );
  }
}
