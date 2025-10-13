import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/AppimageAsset.dart';

class LogoCustom extends StatelessWidget {
  const LogoCustom({
    super.key,
    this.siWidth,
    this.siHeight,
    this.titLetext,
    this.radiuSize,
    this.textColorLogo,
  });
  final double? siWidth;
  final double? siHeight;
  final String? titLetext;
  final double? radiuSize;
  final Color? textColorLogo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: radiuSize,
          backgroundColor: Colors.transparent,
          child: Image.asset(ImageAsset.klogo),
        ),
        Text(
          "${titLetext}",
          style: TextStyle(
            color: textColorLogo,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
