import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/constant/variable.dart';

import '../../../LinkApp.dart';
import '../../../core/functions/imageNetwork.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    super.key,
    this.textTile,
    this.iconLeading,
    this.functionLeading,
    this.iconTrailing,
    this.functionTrailing,
    this.iconTrailing2,
    this.functionTrailing2,
    this.imagePath,
  });

  final String? textTile;
  final Icon? iconLeading;
  final Function()? functionLeading;
  final Icon? iconTrailing;
  final Function()? functionTrailing;
  final Icon? iconTrailing2;
  final Function()? functionTrailing2;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      color: Kcolor().kHeader,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cachedNetworkImage(
                  imageUrl: "${LinkApp.uploadCategories}$imagePath",
                  height: sizeHeight(context) * 0.09,
                  fit: BoxFit.contain,
                  errorWidget: Text(""),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  textTile ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            leading: iconLeading != null
                ? IconButton(
                    onPressed: functionLeading,
                    icon: iconLeading!,
                  )
                : null,
            trailing: (iconTrailing != null || iconTrailing2 != null)
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (iconTrailing != null)
                        IconButton(
                          onPressed: functionTrailing,
                          icon: iconTrailing!,
                        ),
                      if (iconTrailing2 != null)
                        IconButton(
                          onPressed: functionTrailing2,
                          icon: iconTrailing2!,
                        ),
                    ],
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
