import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/AppColor.dart';

import '../../../core/constant/AppimageAsset.dart';

class CardHome extends StatelessWidget {
  final String urlImage;
  final String title;
  final void Function() onclice;
  const CardHome(
      {super.key,
      required this.urlImage,
      required this.title,
      required this.onclice});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclice,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "${ImageAsset.kPaidAuctions}/${urlImage}",
              width: 100,
              height: 100,
            ),
            Text(
              "${title}",
              style: TextStyle(color: Kcolor().kThirdColor),
            ),
          ],
        ),
      ),
    );
  }
}
