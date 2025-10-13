import 'package:flutter/material.dart';

class TitleH2Ads extends StatelessWidget {
  const TitleH2Ads({
    super.key,
    this.textTitleH2,
    this.sizeFont,
    this.colorFont,
  });
  final String? textTitleH2;
  final double? sizeFont;
  final Color? colorFont;

  @override
  Widget build(BuildContext context) {
    return Text(
      textTitleH2!,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: sizeFont ?? 16,
          color: colorFont ?? Colors.black),
    );
  }
}
