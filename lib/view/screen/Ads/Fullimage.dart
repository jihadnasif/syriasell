import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/imageNetwork.dart';

class ImageFullPage extends StatelessWidget {
  final String imagePath;

  const ImageFullPage({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: InteractiveViewer(
          child: cachedNetworkImage(
            //height: sizeHeight(context) * 0.25,
            //height: 50,
            imageUrl: imagePath,
            fit: BoxFit.contain,
            errorWidget: Icon(Icons.broken_image, size: 40),
          ),
        ),
      ),
    );
  }
}
