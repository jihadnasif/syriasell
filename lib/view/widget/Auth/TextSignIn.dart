import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/AppColor.dart';

class TextSignIn extends StatelessWidget {
  const TextSignIn({
    super.key,
    required this.titleText,
  });
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${titleText}',
      style: TextStyle(
        color: Kcolor().kSecondaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
