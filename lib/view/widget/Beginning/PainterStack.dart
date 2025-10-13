import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/AppColor.dart';

class PainterStack extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = Kcolor().kPrimaryColor
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0001600, size.height * -0.0096188);
    path_0.lineTo(size.width * 1.0008000, size.height * 0.0009384);
    path_0.quadraticBezierTo(size.width * 1.0072400, size.height * 0.6045748,
        size.width * 1.0076400, size.height * 0.7842815);
    path_0.cubicTo(
        size.width * 0.4711600,
        size.height * 0.8511730,
        size.width * 0.0918400,
        size.height * 0.4835484,
        size.width * 0.0005600,
        size.height * 0.1653079);
    path_0.quadraticBezierTo(size.width * 0.0004000, size.height * 0.0907918,
        size.width * -0.0001600, size.height * -0.0096188);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);

    // Layer 1

    Paint paint_fill_1 = Paint()
      ..color = Kcolor().kSecondaryColor
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 1.0007200, size.height * 0.7882405);
    path_1.cubicTo(
        size.width * 1.0041400,
        size.height * 0.9703519,
        size.width * 1.0041600,
        size.height * 0.9364223,
        size.width * 1.0052800,
        size.height * 0.9971261);
    path_1.cubicTo(
        size.width * 0.3901600,
        size.height * 1.0029619,
        size.width * 0.1333600,
        size.height * 0.8020528,
        size.width * -0.0012000,
        size.height * 0.6356305);
    path_1.cubicTo(
        size.width * -0.0000800,
        size.height * 0.4844282,
        size.width * 0.0002000,
        size.height * 0.3320821,
        size.width * 0.0013200,
        size.height * 0.1809091);
    path_1.cubicTo(
        size.width * 0.1408000,
        size.height * 0.4300000,
        size.width * 0.3365600,
        size.height * 0.8239296,
        size.width * 1.0007200,
        size.height * 0.7882405);
    path_1.close();

    canvas.drawPath(path_1, paint_fill_1);

    // Layer 1

    Paint paint_stroke_1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_1, paint_stroke_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
