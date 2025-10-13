import 'package:flutter/material.dart';

import '../../../core/constant/AppimageAsset.dart';

class CustomImageAuth extends StatelessWidget {
  const CustomImageAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Image.asset(ImageAsset.klogo),
      radius: MediaQuery.of(context).size.height * 0.1,
      backgroundColor: Colors.transparent,
    );
  }
}
