import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/AppColor.dart';

class CardMore extends StatelessWidget {
  const CardMore({
    super.key,
    this.iconData,
    this.text,
    this.onTap,
  });
  final IconData? iconData;
  final String? text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.only(
          right: 16,
          bottom: 16,
          left: 16,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Kcolor().kButtonHome,
                child: Icon(
                  iconData,
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              flex: 8,
              child: Text(
                text!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
