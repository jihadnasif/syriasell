import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/variable.dart';

class ButtonChangeLang extends StatelessWidget {
  const ButtonChangeLang({
    super.key,
    this.onTap,
    this.colorButton,
    this.text,
    this.isSelected,
  });
  final void Function()? onTap;
  final Color? colorButton;
  final String? text;
  final bool? isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          left: 10,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: sizedWidth(context) * 0.03,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: colorButton,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            if (isSelected == true) Icon(Icons.check),
            if (isSelected == true) SizedBox(width: 10),
            Text(
              text!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
