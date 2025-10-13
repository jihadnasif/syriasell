import 'package:flutter/material.dart';

class CustomTextTilteAuth extends StatelessWidget {
  const CustomTextTilteAuth({
    super.key,
    this.textTitle,
  });
  final String? textTitle;
  @override
  Widget build(BuildContext context) {
    return Text(
      "${textTitle}",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
    );
  }
}
