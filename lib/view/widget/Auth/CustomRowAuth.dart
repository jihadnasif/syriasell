import 'package:flutter/material.dart';

import '../../../core/constant/AppColor.dart';

class CustomRowAuth extends StatelessWidget {
  const CustomRowAuth({
    Key? key,
    this.textQuestion,
    this.textOnTap,
    this.ontap,
  }) : super(key: key);
  final String? textQuestion;
  final String? textOnTap;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${textQuestion}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: ontap,
          child: Text(
            "${textOnTap}",
            style: TextStyle(
              color: Kcolor().kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
