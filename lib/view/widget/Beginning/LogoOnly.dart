import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/AppimageAsset.dart';

class LogoOnly extends StatelessWidget {
  const LogoOnly({
    super.key,
    this.siWidth,
    this.siHeight,
    this.radiuSize,
  });

  final double? siWidth;
  final double? siHeight;
  final double? radiuSize;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radiuSize,
      backgroundColor: Colors.transparent,
      child: Image.asset(ImageAsset.klogo),
    );
  }
}
