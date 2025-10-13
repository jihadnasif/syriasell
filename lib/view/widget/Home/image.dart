import 'package:flutter/material.dart';

class BottomArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height - 30);

    path.quadraticBezierTo(
      size.width / 2, size.height + 30, // نقطة الانحناء العلوية
      size.width, size.height - 30, // النهاية
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
