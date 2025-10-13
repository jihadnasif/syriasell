import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/AppColor.dart';

class TitleH1Ads extends StatelessWidget {
  const TitleH1Ads({
    super.key,
    this.textTitleH1,
  });
  final String? textTitleH1;
  @override
  Widget build(BuildContext context) {
    return Text(
      textTitleH1!,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Kcolor().kTitleText,
        fontSize: 18,
      ),
    );
  }
}
