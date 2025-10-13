import 'package:flutter/material.dart';

SizedLottieWidth(BuildContext context) {
  var widLot = MediaQuery.of(context).size.width * 0.3;
  return widLot;
}

SizedLottieHight(BuildContext context) {
  var heiLot = MediaQuery.of(context).size.width * 0.3;
  return heiLot;
}

class SizedConfig {
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;
  void SizedWidget(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation; //screen orientation
    defaultSize = orientation == Orientation.landscape
        ? screenHeight! * 0.024
        : screenWidth! * 0.024;
  }
}
