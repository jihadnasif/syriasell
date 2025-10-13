import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/AppColor.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.textIcon,
    required this.active,
  });
  final VoidCallback onPressed;
  final IconData icon;
  final String textIcon;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active == true ? Kcolor().KlightBlueAccent : Kcolor().kwhite,
          ),
          Text(
            textIcon,
            style: TextStyle(
              color:
                  active == true ? Kcolor().KlightBlueAccent : Kcolor().kwhite,
            ),
          ),
        ],
      ),
    );
  }
}
