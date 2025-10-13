import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/constant/AppimageAsset.dart';
import 'package:syria_sell/core/constant/variable.dart';

class HeaderOnlyHome extends StatelessWidget {
  const HeaderOnlyHome({
    super.key,
    this.textTile,
    this.iconLeading,
    this.functionLeading,
    this.iconTrailing,
    this.functionTrailing,
    this.trailing2,
    this.functionTrailing2,
    this.imagePath,
  });

  final String? textTile;
  final Icon? iconLeading;
  final Function()? functionLeading;
  final Icon? iconTrailing;
  final Function()? functionTrailing;
  final String? trailing2;
  final Function()? functionTrailing2;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 112,
      color: Kcolor().kHeader,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: sizedWidth(context) * 0.25,
            child: IconButton(
              onPressed: functionLeading,
              icon: iconLeading!,
            ),
          ),
          Text(
            textTile ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: sizedWidth(context) * 0.25,
            child: InkWell(
              onTap: functionTrailing2,
              child: Image.asset(
                "${ImageAsset.KrootImageIcons}/$trailing2",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
