import 'package:flutter/material.dart';

class TitlePageHome extends StatelessWidget {
  const TitlePageHome({
    super.key,
    this.text,
    this.onTap,
  });
  final String? text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
