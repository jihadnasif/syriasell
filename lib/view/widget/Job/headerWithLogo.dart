import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/AppimageAsset.dart';
import 'package:syria_sell/core/constant/variable.dart';

import '../../../core/constant/AppColor.dart';

class HeaderWithLogo extends StatelessWidget {
  const HeaderWithLogo({
    super.key,
    this.textTile,
  });

  final String? textTile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      color: Kcolor().kHeader,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              textTile ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          CircleAvatar(
            radius: sizedWidth(context) * 0.1,
            backgroundColor: Colors.transparent,
            child: Image.asset(
              ImageAsset.klogo,
            ),
          ),
        ],
      ),
    );
  }
}
