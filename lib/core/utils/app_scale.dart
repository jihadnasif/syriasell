import 'package:flutter/material.dart';

class AppScale {
  static const double baseWidth = 375;
  static const double baseHeight = 812;

  static late double scale;
  static late double scaleW;
  static late double scaleH;
  static bool _initialized = false;

  /// تستدعى مرة واحدة بعد بناء الـ context في أول شاشة
  static void init(BuildContext context) {
    if (_initialized) return; // لا تعيد الحساب أكثر من مرة

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    scaleW = screenWidth / baseWidth;
    scaleH = screenHeight / baseHeight;
    scale = (scaleW + scaleH) / 2;

    // نحدّ من المبالغة في التكبير
    if (scale > 1.5) scale = 1.5;
    if (scale < 0.8) scale = 0.8;

    _initialized = true;
  }
}
