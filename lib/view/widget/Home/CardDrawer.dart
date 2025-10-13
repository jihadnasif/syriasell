import 'package:flutter/material.dart';

class CardDrawer extends StatelessWidget {
  const CardDrawer({
    super.key,
    this.onTap,
    this.text,
    this.iconData,
  });
  final void Function()? onTap;
  final String? text;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text!,
              ),
              Icon(iconData),
            ],
          ),
        ),
      ),
    );
  }
}
