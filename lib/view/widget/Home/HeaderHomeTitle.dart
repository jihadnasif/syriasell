import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/AppColor.dart';

class HeaderHomeTitle extends StatelessWidget {
  const HeaderHomeTitle({
    super.key,
    this.textTile,
    this.iconLeading,
    this.functionLeading,
    this.iconTrailing,
    this.functionTrailing,
    this.Trailing2,
    this.functionTrailing2,
  });

  final String? textTile;
  final Icon? iconLeading;
  final Function()? functionLeading;
  final Icon? iconTrailing;
  final Function()? functionTrailing;
  final Widget? Trailing2;
  final Function()? functionTrailing2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      color: Kcolor().kHeader,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              textTile ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            leading: iconLeading != null
                ? IconButton(
                    onPressed: functionLeading,
                    icon: iconLeading!,
                  )
                : null,
            trailing: (iconTrailing != null || Trailing2 != null)
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (iconTrailing != null)
                        IconButton(
                          onPressed: functionTrailing,
                          icon: iconTrailing!,
                        ),
                      if (Trailing2 != null)
                        InkWell(
                          onTap: functionTrailing2,
                          child: Trailing2,
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
