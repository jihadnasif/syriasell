import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/constant/variable.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
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
          left: sizedWidth(context) * 0.1,
          right: sizedWidth(context) * 0.1,
        ),
        decoration: BoxDecoration(
          color: Kcolor().kButtonHome,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Text(
          "${textButton}",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
