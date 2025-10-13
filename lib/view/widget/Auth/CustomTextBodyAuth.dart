import 'package:flutter/material.dart';

import '../../../core/constant/AppColor.dart';

class CustomTextBodyAuth extends StatelessWidget {
  const CustomTextBodyAuth({
    Key? key,
    this.textBody,
  }) : super(key: key);
  final String? textBody;
  @override
  Widget build(BuildContext context) {
    return Text(
      "${textBody}",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Kcolor().kSecondaryColor,
          ),
    );
  }
}
