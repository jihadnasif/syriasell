import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/constant/AppimageAsset.dart';

class Testlottie extends StatelessWidget {
  const Testlottie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        IconButton(
          onPressed: () {
            // Get.back();
          },
          icon: Icon(Icons.close, size: 50),
        ),
        SizedBox(
          width: 200,
          height: 200,
          child: Lottie.asset(ImageAsset.newLoding,
              fit: BoxFit.contain, width: 200, height: 200),
        ),
      ],
    ));
  }
}
