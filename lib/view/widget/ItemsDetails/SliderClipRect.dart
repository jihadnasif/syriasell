import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/variable.dart';

import '../../../core/functions/imageNetwork.dart';

class SliderClipRect extends StatelessWidget {
  const SliderClipRect({
    super.key,
    this.imagePath,
  });

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: sizedWidth(context) * 0.7,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: cachedNetworkImage(
          imageUrl: imagePath!,
          fit: BoxFit.contain,
          width: double.infinity,
          errorWidget: Icon(Icons.broken_image, size: 40),
        ),
      ),
    );
  }
}
