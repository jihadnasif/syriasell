import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/constant/variable.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth({
    Key? key,
    this.onpressed,
    this.textButton,
  }) : super(key: key);
  final VoidCallback? onpressed;
  final String? textButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: sizedWidth(context) * 0.08,
      ),
      margin: EdgeInsets.only(
        top: sizeHeight(context) * 0.02,
      ),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 13),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: Kcolor().kSecondaryColor,
        onPressed: onpressed,
        child: Text(
          "${textButton}",
          style: TextStyle(
            color: Kcolor().kwhite,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
